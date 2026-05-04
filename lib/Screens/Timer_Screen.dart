import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_managemnet/Provider/TimerProvider.dart';
import 'package:student_managemnet/Screens/StopWatch.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  TextEditingController seconds = TextEditingController();
  TextEditingController min = TextEditingController();
  TextEditingController hour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Timerprovider>(
            builder: (context, value, child) {
              return Text(
                "${value.getHour.toString().padLeft(2, "0")}:${value.getMint.toString().padLeft(2, "0")}:${value.getSecondes.toString().padLeft(2, "0")}",
                style: GoogleFonts.inter(fontSize: 30),
              );
            },
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: seconds,
                    decoration: InputDecoration(
                      label: Text(
                        "Seconds",
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: min,
                    decoration: InputDecoration(
                      label: Text(
                        "Mintues",
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: hour,
                    decoration: InputDecoration(
                      label: Text(
                        "Hour",
                        style: GoogleFonts.inter(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<Timerprovider>().setTimer(
                        int.tryParse(seconds.text) ?? 0,
                        int.tryParse(min.text) ?? 0,
                        int.tryParse(hour.text) ?? 0,
                      );
                      context.read<Timerprovider>().timerStart();
                      Navigator.pop(context);
                    },
                    child: Text("SetTimer"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
