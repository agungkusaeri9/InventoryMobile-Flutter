import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> saveTokens(Map<String, dynamic> tokenData) async {
    await _storage.write(key: "accessToken", value: tokenData['accessToken']);
    await _storage.write(key: "refreshToken", value: tokenData['refreshToken']);
    await _storage.write(key: "expiresIn", value: tokenData['expiresIn']);
  }

  Future<void> saveUser(Map<String, dynamic> userData) async {
    await _storage.write(key: "userId", value: userData['userId']);
    await _storage.write(key: "username", value: userData['username']);
  }

  Future<String?> getAccessToken() => _storage.read(key: "accessToken");
  Future<String?> getRefreshToken() => _storage.read(key: "refreshToken");
  Future<String?> getExpiresInToken() => _storage.read(key: "expiresIn");

  Future<String?> getUserId() => _storage.read(key: "userId");
  Future<String?> getUsername() => _storage.read(key: "username");

  Future<void> clearTokens() async => _storage.deleteAll();
}
