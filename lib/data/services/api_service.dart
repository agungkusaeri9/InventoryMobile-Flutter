import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  late Dio dio;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://192.168.245.191:7230/api",
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {"Content-Type": "application/json"},
      ),
    );

    // 🔥 Disable SSL validation (dev only!)
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // ✅ Interceptor untuk request → inject token
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: "accessToken");
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Kalau butuh toast untuk selain GET
          if (response.requestOptions.method != "GET") {
            // Fluttertoast.showToast(msg: "Request success ✅");
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          final status = e.response?.statusCode;
          final data = e.response?.data;

          if (status == 422 && data?['errors'] != null) {
            // Validasi error
            (data['errors'] as Map).forEach((key, messages) {
              if (messages is List) {
                for (var msg in messages) {
                  _showToast(msg);
                }
              }
            });
          } else if (status == 401) {
            _showToast("Authentication failed. Please login again.");
          } else if ([400, 403, 404, 500].contains(status)) {
            _showToast(data?['message'] ?? "Request failed. Please try again.");
          } else if (e.response == null) {
            _showToast("Network error. Please check your connection.");
          } else {
            _showToast(data?['message'] ?? "An unexpected error occurred.");
          }

          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(String path, {dynamic params}) async {
    return dio.get(path, queryParameters: params);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return dio.post(path, data: data);
  }

  void _showToast(String message) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   backgroundColor: const Color(0xFFFEE2E2),
    //   textColor: const Color(0xFF991B1B),
    // );
  }
}
