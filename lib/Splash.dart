import 'package:flutter/material.dart';
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
    await Future.delayed(Duration(milliseconds: 2000),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/Images/GGLogo.png', alignment: Alignment.bottomCenter,width: 250, height: 191 ),
                const Text(
                  "GAMBLERS",
                  style: TextStyle(
                      fontFamily: 'ModernWarfare',
                      fontSize: 27,
                      color: Colors.white
                  ),
                ),
                const Text(
                  "GAMING",
                  style: TextStyle(
                      fontFamily: 'ModernWarfare',
                      fontSize: 27,
                      color: Color.fromARGB(255, 255, 15, 24)
                  ),
                ),
              ],
            )
          ),
      ),
    );
  }
}
