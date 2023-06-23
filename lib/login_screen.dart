import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
class LogInScreen extends StatelessWidget{
  const LogInScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Image.asset('assets/Images/GGLogo.png', width: 150,),
          const SizedBox(height: 10,),
          //UserIcon
          Column(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 128, 8, 12),
                          blurRadius: 18,
                          spreadRadius: 5
                      )
                    ]
                ),
                child: Image.asset('assets/Images/user.png', alignment: Alignment.bottomCenter, ),
              ),
            ],
          ),
          const SizedBox(height: 40,),
          Text(
              'WELCOME BACK!',
              style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 20)),
          const SizedBox(height: 30,),
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 128, 8, 12),
                  )
                ),
                labelText: 'Email or UserName',
                labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 128, 8, 12),
                      )
                  ),
                  labelText: 'Password',
                  labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 40,),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 15, 24),
                  fixedSize: const Size(150, 35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
              child: const Text('LOGIN' , style: TextStyle(
                  fontFamily: 'MSPGothic',
                  color: Colors.white,
                fontSize: 20
              ))
          ),
          const SizedBox(height: 27,),
          Text('or', style: GoogleFonts.orbitron(
            fontSize: 18,
            color: Colors.white
          )),
          const SizedBox(height: 27,),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(200, 35),
                  side: const BorderSide(color: Color.fromARGB(255, 255, 15, 24), width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
              child: const Text('Create Account' , style: TextStyle(
                  fontFamily: 'MSPGothic',
                  color: Colors.white,
                  fontSize: 20
              ))
          ),
        ],
      ),
    );
  }
}