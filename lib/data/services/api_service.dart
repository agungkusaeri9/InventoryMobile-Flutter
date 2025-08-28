import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.245.239:6000/api",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {"Content-Type": "application/json"},
    ),
  );

  Future<Response> post(String path, {dynamic data}) async {
    return dio.post(path, data: data);
  }
}
