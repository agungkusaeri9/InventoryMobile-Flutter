import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/api_service.dart';
import '../../data/services/storage_service.dart';
import '../../data/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService api;
  final StorageService storage;

  AuthCubit(this.api, this.storage) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    emit(AuthLoading());
    try {
      final response = await api.post("/auth/login", data: {
        "username": username,
        "password": password,
      });

      if (response.statusCode == 200 && response.data['status'] == true) {
        final userData = response.data['data']['user'];
        final tokenData = response.data['data']['tokens'];
        await storage.saveTokens(tokenData);
        await storage.saveUser(userData);
        final user = UserModel.fromJson(userData);

        // print(user);
        emit(AuthSuccess(user));
      } else {
        emit(AuthFailure(response.data['message'] ?? "Login gagal"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final errorMessage = e.response?.data?['message'] ?? e.message;

        if (statusCode == 400 || statusCode == 422) {
          emit(AuthFailure("Input salah: $errorMessage"));
        } else if (statusCode == 401) {
          emit(AuthFailure("Unauthorized: Token tidak valid"));
        } else if (statusCode == 404) {
          emit(AuthFailure("API tidak ditemukan (404)"));
        } else if (statusCode == 500) {
          emit(AuthFailure("Server error (500): $errorMessage"));
        } else {
          emit(AuthFailure("Error tidak dikenal ($statusCode): $errorMessage"));
        }
      } else {
        // error tanpa response (misalnya koneksi mati)
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          emit(AuthFailure("Koneksi timeout, coba lagi nanti"));
        } else if (e.type == DioExceptionType.badCertificate) {
          emit(AuthFailure("Sertifikat SSL tidak valid"));
        } else {
          emit(AuthFailure("Tidak bisa terhubung ke server: ${e.message}"));
        }
      }
    } catch (e) {
      emit(AuthFailure("Unexpected error: $e"));
    }
  }

  Future<void> logout() async {
    await storage.clearTokens();
    emit(AuthInitial());
  }

  Future<void> checkLogin() async {
    emit(AuthChecking());
    final token = await storage.getAccessToken();
    final username = await storage.getUsername();
    if (token != null && username != null) {
      final user = UserModel(id: "1", username: username);
      emit(AuthSuccess(user));
    } else {
      emit(AuthInitial());
    }
  }
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthChecking extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
