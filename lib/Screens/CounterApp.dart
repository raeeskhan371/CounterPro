import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_managemnet/Components/AlertBox.dart';
import 'package:student_managemnet/Provider/Counter_Provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    print("print");

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
                  // First icon
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
                  // Counter Text
                  Text(
                    "Counter",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // smile icon
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
              // main Circular Container
              Consumer<CounterProvider>(
                builder: (context, value, child) {
                  return Container(
                    height: 300,
                    width: 300,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: value.containerColor.withOpacity(0.3),
                          offset: Offset(4, 8),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Current Count',
                          style: GoogleFonts.inter(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          value.getCounter.toString(),
                          style: GoogleFonts.inter(
                            color: value.textColor,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 100),
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         "•",
                        //         style: GoogleFonts.inter(
                        //           color:containerColor,
                        //           fontSize: 15,
                        //         ),
                        //       ),
                        //       SizedBox(width: 15),
                        //       Text(
                        //         "Positive",
                        //         style: GoogleFonts.inter(
                        //           color: containerColor,
                        //           fontSize: 14,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // decrement
                  GestureDetector(
                    onTap: () {
                      context.read<CounterProvider>().decerement();
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,

                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.4),
                                offset: Offset(0, 10),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Decrement",
                          style: GoogleFonts.inter(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Reset Button
                  GestureDetector(
                    onTap: () {
                      showAboutDialog(context: context);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                offset: Offset(0, 10),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Reset",
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Incremet Button
                  GestureDetector(
                    onTap: () {
                      context.read<CounterProvider>().incerement();
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,

                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.4),
                                offset: Offset(0, 10),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Icon(Icons.add, color: Colors.green, size: 35),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Inecrement",
                          style: GoogleFonts.inter(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              // lower Text
              Container(
                height: 40,
                width: 300,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/bulb.png"),
                          ),
                        ),
                      ),
                      Text(
                        "Tap + to increase, - to decrease",
                        style: GoogleFonts.inter(color: Colors.grey.shade700),
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
