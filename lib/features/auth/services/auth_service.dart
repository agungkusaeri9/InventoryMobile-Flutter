import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "http://192.168.245.242:5188/api/auth"));

  Future<void> login(String username, String password) async {
    await _dio.post('/login', data: {
      'username': username,
      'password': password,
    });
  }

  Future<void> register(
      String name, String username, String email, String password) async {
    await _dio.post('/register', data: {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });
  }

  Future<void> logout() async {
    await _dio.post('/logout');
  }
}
