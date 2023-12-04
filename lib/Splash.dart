
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
    await Future.delayed(const Duration(milliseconds: 10000),() {});
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
                  'assets/Images/Logo.png',
                  alignment: Alignment.center,
                  width: width < 500 ? screenWidth * 0.42 : screenWidth * 0.44,
                  height: height < 1000 ? screenHeight * 0.12 : screenHeight * 0.14
              ),


              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: screenWidth * 0.28),
                  child: SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.1,
                    child: RichText(
                      text: TextSpan(
                          text: 'Fulltime Under',
                          style: TextStyle(
                             fontFamily: 'MSPGothic',
                               fontSize: 16,
                               color: Colors.white
                           ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Ground Gaming',
                              style: TextStyle(
                                  fontFamily: 'MSPGothic',
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 15, 24, 1)
                               ),)
                          ]),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: screenWidth * 0.7,
              //   height: height < 1000 ? screenHeight * 0.035 : screenHeight * 0.04,
              //   child: Text(
              //     "Fulltime Under",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontFamily: 'ModernWarfare',
              //         fontSize: width < 500 ? 24 : 29,
              //         color: Colors.white
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: width < 500 ? screenWidth * 0.7 : screenWidth * 0.7,
              //   height: height < 1000 ? screenHeight * 0.03 : screenHeight * 0.04,
              //   child: Text(
              //     "Ground Gaming",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontFamily: 'ModernWarfare',
              //         fontSize: width < 500 ? 24 : 29,
              //         color: Color.fromARGB(255, 255, 15, 24)
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    });

  }
}
