import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RouteGuard {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: "token");
    return token != null;
  }

  Future<void> guardRoute(BuildContext context, String routeName) async {
    final loggedIn = await isLoggedIn();
    if (loggedIn) {
      if (!context.mounted) return;
      Navigator.pushNamed(context, routeName);
    } else {
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
