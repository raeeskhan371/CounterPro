import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CounterProvider with ChangeNotifier {
  List<Color> myColors = [
    Colors.red,
    Colors.orange,
    Colors.blue,
    Colors.amber,
    Colors.purple,
  ];
  double _containerSize = 40;
  int _counter = 0;

  Color textColor = Colors.grey;
  Color containerColor = Colors.white;

  int get getCounter => _counter;
  double get getCounainerSize => _containerSize;

  void incerement() {
    _counter++;

    updateColor();
    ContainerSize();
    notifyListeners();
  }

  void decerement() {
    _counter--;
    updateColor();
    ContainerSize();
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    updateColor();
    notifyListeners();
  }

  void updateColor() {
    if (_counter == 0) {
      containerColor = Colors.grey;
      textColor = Colors.grey;
      return;
    }

    int index = _counter.abs() % myColors.length;
    containerColor = myColors[index];
    textColor = myColors[index];
  }

  void ContainerSize() {
    _containerSize += 30;

    if (_counter == 0) {
      _containerSize = 250;
    } else if (_counter < 0) {
      _containerSize -= 30;
    }
  }
}
