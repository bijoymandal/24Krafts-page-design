// lib/core/storage/secure_storage.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'access_token');
  }

  // NEW: Save full user profile after login
  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    await _storage.write(key: 'user_data', value: jsonEncode(userData));
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final data = await _storage.read(key: 'user_data');
    if (data == null) return null;
    return jsonDecode(data);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
