import 'package:app/services/api_service.dart';
import 'package:app/utils/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController {
  final ApiService _apiService = ApiService();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> login(
      String username, String password, BuildContext context) async {
    try {
      final response = await _apiService.login(username, password);
      final token = response['data']['token'];

      await _storage.write(key: 'token', value: token);

      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      errorSnackBar(context, 'username atau password salah');
    }
  }

  Future<void> logout(BuildContext context) async {
    await _storage.delete(key: "token");

    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }
}
