import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timerprovider with ChangeNotifier {
  int _hour = 0;
  int _mint = 0;
  int _secodes = 0;
  Timer? timer;

  int get getHour => _hour;
  int get getMint => _mint;
  int get getSecondes => _secodes;

  // set Timer Function
  void setTimer(int h, int m, int s) {
    _hour = h;
    _mint = m;
    _secodes = s;

    notifyListeners();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _secodes++;
      if (_secodes > 60) {
        _secodes = 0;
        _mint++;
      } else if (_mint == 60) {
        _secodes = 0;
        _mint == 0;
        _hour++;
      }
      notifyListeners();
    });
  }

  void Stop() {}
}
