import 'package:flutter/material.dart';

class ChangeCounter extends ChangeNotifier {
  int _count = 0;

  int getCounter() => _count;

  void inCrement() {
    _count++;
    notifyListeners();
  }

  void deCrement() {
    if (_count > 0) {
      _count--;
    }
    notifyListeners();
  }
}
