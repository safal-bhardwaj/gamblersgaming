import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Gamer/account_screen.dart';

import 'Host/account_screen.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({super.key});

  @override
  Widget build(context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 10),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/Images/GGLogo.png',
              width: screenWidth * 0.3,
              height: screenHeight * 0.1,
            ),
            SizedBox(height: screenHeight * 0.01,),
            SizedBox(
              width: screenWidth * 0.5,
              height: screenHeight * 0.04,
              child: const Text('CHOOSE YOUR SIDE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MSPGothic',
                color: Colors.white,
                fontSize: 18
              )),
            ),
            SizedBox(height: screenHeight * 0.03,),
            //GamerButton
            Container(
              width: screenWidth * 0.56,
              height: screenHeight * 0.19,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 128, 8, 12),
                    blurRadius: 20,
                    spreadRadius: 5
                  )
                ]
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AccountScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: Size(screenWidth * 0.56, screenHeight * 0.19),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0)
                ),
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/Images/Gamer/game-controller (3).png',
                      width: screenWidth * 0.18,

                    ),
                    SizedBox(height: screenHeight * 0.01,),
                    Text(
                      'GAMER',
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 17
                      ),),
                  ],
                )
              ),
            ),
            //GameMakerButton
            SizedBox(height: screenHeight * 0.06,),
            Container(
              width: screenWidth * 0.44,
              height: screenHeight * 0.18 ,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(8,10,128,24),
                        blurRadius: 20,
                        spreadRadius: 5
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AccountScreenHost()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: Size(screenWidth * 0.44, screenHeight * 0.18 ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.all(16.0)
                ),
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                    Image.asset(
                  'assets/Images/Gamer/game-controller-host.png',
                  width: screenWidth * 0.17,

                ),
                    SizedBox(height: screenHeight * 0.01,),
                    Text(
                      'GAME MAKER',
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 17
                      ),),
                  ]),
                )
              ),

            const SizedBox(height:40 ),
            //GamblersGamingText
            SizedBox(
              width: screenWidth * 0.5,
              height: screenHeight * 0.03,
              child: const Text(
                "GAMBLERS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'ModernWarfare',
                  fontSize: 27,
                  color: Color.fromRGBO(255,15,24,1),

                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.5,
              height: screenHeight * 0.03,
              child: const Text(
                "GAMING",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'ModernWarfare',
                    fontSize: 27,
                    color: Color.fromRGBO( 255, 255, 255 , 1)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}