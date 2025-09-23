import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveTokens(Map<String, dynamic> tokenData) async {
    await _storage.write(key: "accessToken", value: tokenData['token']);
    await _storage.write(key: "refreshToken", value: tokenData['refreshToken']);
    await _storage.write(key: "expiresIn", value: tokenData['expiredAt']);
  }

  Future<void> saveUser(Map<String, dynamic> userData) async {
    await _storage.write(key: "userId", value: userData['id'].toString());
    await _storage.write(key: "email", value: userData['email']);
    await _storage.write(key: "username", value: userData['username']);
  }

  Future<Map<String, dynamic>> getUser() async => {
        "userId": (await _storage.read(key: "userId")) ?? "",
        "email": (await _storage.read(key: "email")) ?? "",
        "username": (await _storage.read(key: "username")) ?? "",
      };

  Future<String?> getAccessToken() => _storage.read(key: "accessToken");
  Future<String?> getRefreshToken() => _storage.read(key: "refreshToken");
  Future<String?> getExpiresInToken() => _storage.read(key: "expiresIn");

  Future<String?> getUserId() => _storage.read(key: "userId");
  Future<String?> getUsername() => _storage.read(key: "username");

  Future<void> clearTokens() async => _storage.deleteAll();
}
