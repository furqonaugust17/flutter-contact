import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  static String? token;
  final String api = "http://localhost:8000/api";
  Future<bool> login(
      {required String username, required String password}) async {
    try {
      final response = await http.post(Uri.parse("$api/users/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"username": username, "password": password}));

      Map obj = jsonDecode(response.body);
      token = obj['data']['token'];
      return true;
    } catch (e) {
      return false;
    }
  }
}
