import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timerprovider with ChangeNotifier {
  int _hour = 0;
  int _mint = 0;
  int _secodes = 0;

  bool isRunning = true;
  Timer? timer;
  Color containerColor = Colors.white;

  int get getHour => _hour;
  int get getMint => _mint;
  int get getSecondes => _secodes;

  // set Timer Function
  void setTimer(int s, int m, int h) {
    int totalSeconds = (h * 3600) + (m * 60) + s;
    _hour = totalSeconds ~/ 3600;
    _mint = (totalSeconds % 3600) ~/ 60;
    _secodes = totalSeconds % 60;

    notifyListeners();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _secodes++;
      if (_secodes > 59) {
        _secodes = 0;
        _mint++;
      } else if (_mint == 59) {
        _secodes = 0;
        _mint == 0;
        _hour++;
      }
      Color containerColor = Colors.green;
      notifyListeners();
    });
    isRunning = true;
  }

  void Pause() {
    timer!.cancel();
    isRunning = false;
  }

  void reset() {
    timer!.cancel();
    _hour = 0;
    _mint = 0;
    _secodes = 0;

    isRunning = false;
    notifyListeners();
  }

  void resume() {
    if (isRunning) return;
    timer!.cancel();

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

  void timerStart() {
    {
      timer?.cancel();
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_secodes == 0) {
          if (_mint == 0) {
            if (_hour == 0) {
              timer.cancel();
            } else {
              _hour--;
              _mint = 59;
              _secodes = 59;
            }
          } else {
            _mint--;
            _secodes = 59;
          }
        } else {
          _secodes--;
        }
        notifyListeners();
      });
      isRunning = true;
    }
  }

  void pauseTimer() {
    isRunning = false;
    timer!.cancel();
    notifyListeners();
  }

  void resumeTimer() {
    isRunning = true;
    timer!.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secodes == 0) {
        if (_mint == 0) {
          if (_hour == 0) {
            timer.cancel();
          } else {
            _hour--;
            _mint = 59;
            _secodes = 59;
          }
        } else {
          _mint--;
          _secodes = 59;
        }
      } else {
        _secodes--;
      }
      notifyListeners();
    });
  }
}
