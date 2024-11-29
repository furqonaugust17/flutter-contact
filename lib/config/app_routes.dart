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
          return FutureBuilder<bool>(
            future: _routeGuard.isLoggedIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (snapshot.hasData && snapshot.data == true) {
                return MainPage();
              }

              return LoginScreen();
            },
          );
        },
      );
    }

    if (routes.containsKey(settings.name)) {
      return MaterialPageRoute(builder: routes[settings.name]!);
    }

    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('404 - Page not found')),
      ),
    );
  }
}
