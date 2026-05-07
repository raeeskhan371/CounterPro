import 'package:flutter/material.dart';
import 'package:student_managemnet/Screens/CounterApp.dart';
import 'package:student_managemnet/Screens/StopWatch.dart';
import 'package:student_managemnet/Screens/TimerPro.dart';
import 'package:student_managemnet/Screens/timerProMax.dart';

class BottomeNavgationCounterPro extends StatefulWidget {
  const BottomeNavgationCounterPro({super.key});

  @override
  State<BottomeNavgationCounterPro> createState() =>
      _BottomeNavgationCounterProState();
}

class _BottomeNavgationCounterProState
    extends State<BottomeNavgationCounterPro> {
  int myIndex = 0;
  List<Widget> Screens = [TimerProMax(), Timerpro(), StopWatch()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.orangeAccent),
        currentIndex: myIndex,
        onTap: (value) {
          myIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Counter"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Timer"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "StopWatch"),
        ],
      ),
      body: Screens[myIndex],
    );
  }
}
