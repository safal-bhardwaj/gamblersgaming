import 'package:flutter/material.dart';
import 'package:gamblersgaming/Gamer/account_screen.dart';
import 'Gamer/create_account.dart';
import 'package:gamblersgaming/start_screen.dart';
import 'Gamer/login_screen.dart';
class GamblersGaming extends StatefulWidget{
  const GamblersGaming({super.key});

  @override
  State<GamblersGaming> createState() {
    return _GGState();
  }
}

class _GGState extends State<GamblersGaming>{
  @override
  Widget build(context){
    return MaterialApp(home: Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: const StartScreen(),
        ),
      ),
    ),
    );
  }
}