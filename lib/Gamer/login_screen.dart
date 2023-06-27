import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'create_account.dart';
class LogInScreen extends StatelessWidget{
  const LogInScreen({super.key});

  @override
  Widget build(context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor:const Color.fromRGBO(0, 0, 0, 0),
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, keyboardSpace),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //UserIcon
                Container(
                  width: screenWidth * 0.36,
                  height: screenHeight * 0.18,
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
                  child: Image.asset('assets/Images/Gamer/user.png', alignment: Alignment.center, width: screenWidth * 0.2, height: screenHeight * 0.1,),
                ),
                SizedBox(height: screenHeight * 0.05,),
                Text(
                    'WELCOME BACK!',
                    style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 20)),
                SizedBox(height: screenHeight * 0.03,),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color.fromARGB(255, 128, 8, 12),
                        )
                      ),
                      labelText: 'Email or UserName',
                      labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02,),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(255, 128, 8, 12),
                            )
                        ),
                        labelText: 'Password',
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05,),
                ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 15, 24),
                        fixedSize: Size(screenWidth * 0.48, screenHeight * 0.03),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0)
                        )
                    ),
                    child: const Text('LOGIN' , style: TextStyle(
                        fontFamily: 'MSPGothic',
                        color: Colors.white,
                      fontSize: 20
                    ))
                ),
                SizedBox(height: screenHeight * 0.03,),
                Text('or', style: GoogleFonts.orbitron(
                  fontSize: 18,
                  color: Colors.white
                )),
                SizedBox(height: screenHeight * 0.03,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateAccount()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(screenWidth * 0.48, screenHeight * 0.03),
                        side: const BorderSide(color: Color.fromARGB(255, 255, 15, 24), width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0)
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
          ),
        ),
      ),
    );
  }
}