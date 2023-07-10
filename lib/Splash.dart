import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/HomeScreen.dart';
//import 'package:gamblersgaming/LoadingScreen.dart';
import 'package:gamblersgaming/BottomNavigation.dart';
import 'package:gamblersgaming/Authenticate.dart';
import 'package:gamblersgaming/Gamer/login_screen.dart';
import 'start_screen.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetostart();
  }
  void _navigatetostart() async
  {
    await Future.delayed(const Duration(milliseconds: 3000),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StartScreen()));
    await Future.delayed(Duration(milliseconds: 2000),() {});



    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AuthenticateScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                  'assets/Images/GGLogo.png',
                  alignment: Alignment.center,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.2
              ),
              SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                child: const Text(
                  "GAMBLERS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'ModernWarfare',
                      fontSize: 27,
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                child: const Text(
                  "GAMING",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'ModernWarfare',
                      fontSize: 27,
                      color: Color.fromARGB(255, 255, 15, 24)
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
