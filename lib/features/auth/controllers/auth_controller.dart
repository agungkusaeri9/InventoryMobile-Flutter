import 'package:flutter/material.dart';
import 'package:inventory_mobile_app/features/auth/services/auth_service.dart';

class AuthController with ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<dynamic> login(String username, String password) async {
    try {
      final response = await _authService.login(username, password);
      return response;
      // debugPrint("Login success");
    } catch (e) {
      throw Exception("Login gagal: $e");
      // debugPrint("Login failed: $e");
    }
  }

  Future<void> register(
      String name, String username, String email, String password) async {
    try {
      await _authService.register(name, username, email, password);
      debugPrint("Register success");
    } catch (e) {
      debugPrint("Register failed: $e");
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
      debugPrint("Logout success");
    } catch (e) {
      debugPrint("Logout failed: $e");
    }
  }
}
