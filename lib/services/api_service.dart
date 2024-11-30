import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api";
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(url,
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode({'username': username, 'password': password}));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<List> getContacts() async {
    final url = Uri.parse('$baseUrl/contacs');
    final token = await _storage.read(key: 'token');
    final response = await http.get(url,
        headers: {"Content-Type": "Application/json", "Authorization": token!});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = json['data'] as List;
      return result;
    } else {
      throw Exception(response.body);
    }
  }
}
