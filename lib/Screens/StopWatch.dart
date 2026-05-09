import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_managemnet/Components/AlertBox.dart';
import 'package:student_managemnet/Provider/StopWatch_Provider.dart';
import 'package:student_managemnet/Screens/Set_Timer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
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

                  Column(
                    children: [
                      Text(
                        "StopWatch",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("Stay focused, stay productive."),
                    ],
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
              Consumer<StopWatchProvider>(
                builder: (context, value, child) {
                  return Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            height: 50,
                            width: 50,

                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.clock,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Timer",
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${value.getHour.toString().padLeft(2, "0")}:${value.getMint.toString().padLeft(2, "0")}:${value.getSecondes.toString().padLeft(2, "0")}",
                          style: GoogleFonts.inter(
                            color: Colors.lightBlue,
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
                  GestureDetector(
                    onTap: () {
                      context.read<StopWatchProvider>().startWatch();
                    },
                    child: Container(
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
                  ),
                  // PauseTimer Button
                  GestureDetector(
                    onTap: () {
                      context.read<StopWatchProvider>().stopPause();
                    },
                    child: Container(
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
                  ),
                  //Resume Timer
                  GestureDetector(
                    onTap: () {
                      context.read<StopWatchProvider>().stopResume();
                    },
                    child: Container(
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
                  ),
                ],
              ),

              SizedBox(height: 50),
              // SetTimer Button
              GestureDetector(
                onTap: () {},
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
                      GestureDetector(
                        onTap: () {
                          showResetDialouge(
                            context,
                            onReset: () {
                              context.read<StopWatchProvider>().stopReset();
                            },
                          );
                        },
                        child: Container(
                          height: 60,
                          width: 340,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.redAccent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Reset Timer",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.refresh_outlined, color: Colors.white),
                            ],
                          ),
                        ),
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
