import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CounterProvider with ChangeNotifier {
  double _containerSize = 40;
  int _counter = 0;

  Color textColor = Colors.black;
  Color containerColor = Colors.white;

  int get getCounter => _counter;
  double get getCounainerSize => _containerSize;

  void incerement() {
    _counter++;

    updateColor();

    notifyListeners();
  }

  void decerement() {
    _counter--;
    updateColor();

    notifyListeners();
  }

  void reset() {
    _counter = 0;
    updateColor();

    notifyListeners();
  }

  void updateColor() {
    if (_counter > 0) {
      containerColor = Colors.green;
      textColor = Colors.green;
    } else if (_counter < 0) {
      containerColor = Colors.red;
      textColor = Colors.red;
    } else if (_counter == 0) {
      containerColor = Colors.grey;
      textColor = Colors.grey;
    }

    notifyListeners();
  }
}
