import 'package:flutter/material.dart';
import 'dart:async';

class TimerProvider with ChangeNotifier {
  int _hour = 0;
  int _mint = 0;
  int _secodes = 0;
  bool isRunning = true;
  Timer? timer;
  Color containerColor = Colors.lightBlue;
  int totalSeconds = 0;

  int get getHour => _hour;
  int get getMint => _mint;
  int get getSecondes => _secodes;

  void setTimer(int s, int m, int h) {
    totalSeconds = (h * 3600) + (m * 60) + s;
    _hour = totalSeconds ~/ 3600;
    _mint = (totalSeconds % 3600) ~/ 60;
    _secodes = totalSeconds % 60;

    notifyListeners();
  }

  void startTimer() {
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
        timerColor();

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

  void resetTimer() {
    timer?.cancel();
    _hour = 0;
    _mint = 0;
    _secodes = 0;
    containerColor = Colors.grey.shade500;

    isRunning = false;
    notifyListeners();
  }

  void timerColor() {
    int remaining = (_hour * 3600) + (_mint * 60) + _secodes;
    double percentage = (remaining / totalSeconds) * 100;
    if (percentage > 0) {
      containerColor = Colors.red.withOpacity(1);
      if (percentage > 10) {
        containerColor = Colors.red;
        if (percentage > 20) {
          containerColor = Colors.red;
          if (percentage > 40) {
            containerColor = Colors.red;
            if (percentage > 49) {
              containerColor = Colors.red;
              if (percentage > 50) {
                containerColor = Colors.green;
              }
            } else
              containerColor = Colors.red;
          } else
            containerColor = Colors.red;
        } else
          containerColor = Colors.red;
      } else
        containerColor = Colors.red;
    } else
      containerColor = Colors.grey.shade500;
    notifyListeners();
  }
}

// void timerColor() {
//   int remaining = (_hour * 3600) + (_mint * 60) + _secodes;
//   double percentage = (remaining / totalSeconds) * 100;
//   if (percentage > 50) {
//     containerColor = Colors.green;
//   } else if (percentage < 50) {
//     containerColor = Colors.red.withOpacity(0.3);
//   } else if (percentage < 40) {
//     containerColor = Colors.red.withOpacity(0.5);
//   } else if (percentage < 30) {
//     containerColor = Colors.red.withOpacity(0.6);
//   } else if (percentage < 20) {
//     containerColor = Colors.red.withOpacity(0.7);
//   } else if (percentage < 10) {
//     containerColor = Colors.red.withOpacity(0.8);
//   } else if (percentage > 0) {
//     containerColor = Colors.red.withOpacity(1);
//   } else if (percentage == 0) {
//     containerColor = Colors.grey;
//   }
//   notifyListeners();
// }
