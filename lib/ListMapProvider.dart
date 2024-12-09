import 'package:flutter/material.dart';

class Listmapprovider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = [];

  void addData(Map<String, dynamic> data) {
    _mData.add(data);
    notifyListeners();
  }

  void updatedData(Map<String, dynamic> updated, int index) {
    _mData[index] = updated;
    notifyListeners();
  }

  void removeData(int index) {
    _mData.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getData() => _mData;
}
