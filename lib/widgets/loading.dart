import 'package:app/main.dart';
import 'package:flutter/material.dart';

void showLoading() async {
  await showDialog(
    context: NavigationService.navigatorKey.currentContext!,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator()],
      );
    },
  );
}

void hideLoading() async {
  await Future.delayed(Duration(seconds: 2));
  Navigator.pop(NavigationService.navigatorKey.currentContext!);
}
