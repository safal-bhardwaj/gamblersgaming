import 'package:flutter/material.dart';
import 'package:gamblersgaming/Splash.dart';
import 'package:gamblersgaming/gg.dart';
import 'package:gamblersgaming/start_screen.dart';
//import 'gg.dart';
//import 'start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Splash(),
    );
  }
}



