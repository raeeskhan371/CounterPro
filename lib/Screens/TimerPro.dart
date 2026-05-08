import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_managemnet/Provider/StopWatch_Provider.dart';
import 'package:student_managemnet/Provider/Timer_Provider.dart';
import 'package:student_managemnet/Screens/Set_Timer.dart';

class Timerpro extends StatelessWidget {
  const Timerpro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(1, 2),
                          blurRadius: 10,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage("assets/image 1.png"),
                      ),
                    ),
                  ),

                  Text(
                    "Timer Pro",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(1, 2),
                          blurRadius: 10,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage("assets/image 2.png"),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50),

              // Main Circle
              Consumer<TimerProvider>(
                builder: (context, value, child) {
                  return Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: value.containerColor.withOpacity(1),
                          offset: Offset(2, 2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Container(height: 50, width: 50, color: Colors.grey),
                        Text(
                          "${value.getHour.toString().padLeft(2, "0")}:${value.getMint.toString().padLeft(2, "0")}:${value.getSecondes.toString().padLeft(2, "0")}",
                          style: GoogleFonts.inter(
                            color: value.containerColor,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 75),
                          child: Row(
                            children: [
                              Text(
                                "HH",
                                style: GoogleFonts.inter(
                                  color: Colors.grey.shade700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 35),
                              Text(
                                "MM",
                                style: GoogleFonts.inter(
                                  color: Colors.grey.shade700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 35),
                              Text(
                                "SS",
                                style: GoogleFonts.inter(
                                  color: Colors.grey.shade700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 81),
                          child: GestureDetector(
                            onTap: () {
                              context.read<StopWatchProvider>().stopReset();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20000),
                                  bottomLeft: Radius.circular(20000),
                                  topLeft: Radius.circular(2000),
                                  topRight: Radius.circular(2000),
                                ),
                                color: value.containerColor,
                              ),
                              height: 50,
                              width: 230,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Reset",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 40),
              //Funcional Button StartTimer , pause Timer , Resume Timer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Start Timer Button
                  Container(
                    height: 80,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black)],
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.play,
                          color: Colors.blueAccent.shade700,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Start Timer",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueAccent.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // PauseTimer Button
                  Container(
                    height: 80,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black)],
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.pause,
                          color: Colors.red.shade700,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Pause Timer",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.redAccent.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Resume Timer
                  Container(
                    height: 80,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(10),

                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circlePlay,
                          color: Colors.green.shade700,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Resume Timer",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50),
              // SetTimer Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimerScreen()),
                  );
                },
                child: Container(
                  height: 60,
                  width: 340,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 40,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.shade200,
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.stopwatch,
                            color: Colors.blue.shade400,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Set Timer",
                        style: GoogleFonts.poppins(
                          color: Colors.blue.shade400,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 180),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
