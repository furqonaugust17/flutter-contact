import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    print(index);
    _currentIndex = index;
    notifyListeners();
  }
}
