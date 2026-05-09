import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar_pro/curved_navigation_bar_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managemnet/Screens/CounterApp.dart';
import 'package:student_managemnet/Screens/StopWatch.dart';
import 'package:student_managemnet/Screens/TimerPro.dart';

class BottomeNavgationCounterPro extends StatefulWidget {
  const BottomeNavgationCounterPro({super.key});

  @override
  State<BottomeNavgationCounterPro> createState() =>
      _BottomeNavgationCounterProState();
}

class _BottomeNavgationCounterProState
    extends State<BottomeNavgationCounterPro> {
  int myIndex = 0;
  List<Widget> Screens = [CounterApp(), Timerpro(), StopWatch()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[myIndex],
      bottomNavigationBar: CurvedNavigationBarPro(
        onTap: (value) {
          myIndex = value;
          setState(() {});
        },
        currentIndex: myIndex,
        activeColor: Colors.blue,
        shadowColor: Colors.blue.withOpacity(0.1),
        inactiveTextStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        activeTextStyle: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white,

        fabColor: Colors.blue,

        items: [
          CurvedNavigationItemPro(
            label: "Counter",
            activeIcon: Icons.exposure_plus_1,
            inactiveIcon: Icons.exposure_plus_1_outlined,
          ),
          CurvedNavigationItemPro(
            label: "Timer",
            activeIcon: Icons.timer_sharp,
            inactiveIcon: Icons.timer_outlined,
          ),
          CurvedNavigationItemPro(
            label: "StopWatch",
            activeIcon: Icons.schedule,
            inactiveIcon: Icons.schedule_outlined,
          ),
        ],
      ),
    );
  }
}
