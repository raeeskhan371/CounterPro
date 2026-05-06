import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_managemnet/Provider/StopWatch_Provider.dart';
import 'package:student_managemnet/Provider/Timer_Provider.dart';

import 'package:student_managemnet/Provider/Counter_Provider.dart';
import 'package:student_managemnet/Screens/BottomeNavigation.dart';

import 'package:student_managemnet/Screens/TimerPro.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => StopWatchProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: BottomeNavgationCounterPro(),
    );
  }
}
