import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_managemnet/Screens/CounterApp.dart';
import 'package:student_managemnet/data/Counter_Provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
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
      home: CounterApp(),
    );
  }
}
