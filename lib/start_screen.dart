import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget{
  const StartScreen({super.key});

  @override
  Widget build(context){

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/Images/GGLogo.png', width: 90,),
          const Text('CHOOSE YOUR SIDE',
          style: TextStyle(
            fontFamily: 'MSPGothic',
            color: Colors.white
          )),
          const SizedBox(height: 30,),
          //GamerButton
          Container(
            width: 170,
            height: 170,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 15, 24),
                  blurRadius: 20,
                  spreadRadius: 5
                )
              ]
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: const Size(170, 170),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16.0)
              ),
              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/Images/game-controller (3).png',
                    width: 70,
                    color: const Color.fromARGB(255, 255, 15, 24),
                  ),
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
          const SizedBox(height: 60,),
          Container(
            width: 170,
            height: 170,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 255, 15, 24),
                      blurRadius: 20,
                      spreadRadius: 5
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(170, 170),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.all(16.0)
              ),
              child : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children : [
                  Image.asset(
                'assets/Images/game-controller (4).png',
                width: 70,
                    color: const Color.fromARGB(255, 255, 15, 24),
              ),
                  const SizedBox(height: 10,),
                  Text(
                    'GAME MAKER',
                    style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 17
                    ),),
                ]),
              )
            ),

          const SizedBox(height:70 ),
          //GamblersGamingText
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
      ),
    );
  }
}