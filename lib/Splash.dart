
import 'package:flutter/material.dart';

import 'package:gamblersgaming/Authenticate.dart';

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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AuthenticateScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return LayoutBuilder(builder: (ctx, constraints){
      final width = constraints.minWidth;
      final height = constraints.maxHeight;
      return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                  'assets/Images/GGLogo.png',
                  alignment: Alignment.center,
                  width: width < 500 ? screenWidth * 0.43 : screenWidth * 0.45,
                  height: height < 1000 ? screenHeight * 0.13 : screenHeight * 0.15
              ),
              SizedBox(
                width: screenWidth * 0.5,
                height: height < 1000 ? screenHeight * 0.035 : screenHeight * 0.04,
                child: Text(
                  "GAMBLERS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'ModernWarfare',
                      fontSize: width < 500 ? 24 : 29,
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(
                width: width < 500 ? screenWidth * 0.35 : screenWidth * 0.5,
                height: height < 1000 ? screenHeight * 0.03 : screenHeight * 0.04,
                child: Text(
                  "GAMING",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'ModernWarfare',
                      fontSize: width < 500 ? 24 : 29,
                      color: Color.fromARGB(255, 255, 15, 24)
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

  }
}
