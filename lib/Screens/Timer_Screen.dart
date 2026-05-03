import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_managemnet/Provider/TimerProvider.dart';

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
            child: Column(
              children: [
                TextFormField(controller: seconds),
                TextFormField(controller: min),
                TextFormField(controller: hour),

                ElevatedButton(
                  onPressed: () {
                    context.read<Timerprovider>().setTimer(
                      int.tryParse(seconds.text) ?? 0,
                      int.tryParse(min.text) ?? 0,
                      int.tryParse(hour.text) ?? 0,
                    );
                    context.read<Timerprovider>().timerStart();
                  },
                  child: Text("SetTimer"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Timerprovider>().pauseTimer();
                  },
                  child: Text("PasueTimer"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Timerprovider>().resumeTimer();
                  },
                  child: Text("ResumeTimer"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Timerprovider>().timerStart();
                  },
                  child: Text("timeStart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
