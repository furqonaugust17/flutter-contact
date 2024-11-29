import 'package:app/config/route_guard.dart';
import 'package:app/features/auth/login_screen.dart';
import 'package:app/features/main/main_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final RouteGuard _routeGuard = RouteGuard();

  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginScreen(),
    '/main': (context) => MainPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/main') {
      return MaterialPageRoute(
        builder: (context) {
          _routeGuard.guardRoute(context, 'main');
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
    }

    return MaterialPageRoute(builder: routes[settings.name]!);
  }
}
