import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CreateAccount extends StatefulWidget{
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(context){
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor:const Color.fromRGBO(0, 0, 0, 10),
      ),
      backgroundColor:const Color.fromRGBO(0, 0, 0, 10),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, keyboardSpace),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: screenWidth * 0.36,
                  height: screenHeight * 0.18,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(128, 8, 12, 1),
                            blurRadius: 18,
                            spreadRadius: 5
                        )
                      ]
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: Size(screenWidth * 0.36, screenHeight * 0.18,),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16.0)
                      ),
                      child : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Images/Gamer/user.png',
                            width: screenWidth * 0.2, height: screenHeight * 0.1,
                            color: const Color.fromARGB(255, 255, 15, 24),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(height: screenHeight * 0.03,),
                SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.03,
                  child: Text('WELCOME', textAlign: TextAlign.center ,style: GoogleFonts.orbitron(
                      color: Colors.white, fontSize: 20)),
                ),
            SizedBox(height: screenHeight * 0.02,),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/name.png',
                            width: screenWidth * 0.05,
                            height: screenHeight * 0.05,
                          ),
                          ),
                        hintText: 'Enter your name',
                        labelText: 'Full Name',
                        contentPadding: const EdgeInsets.all(0.0),
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(128, 8, 12, 1),

                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01,),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/user1.png',
                          ),
                        ),
                        hintText: 'Enter your name',
                        labelText: 'UserName',
                        contentPadding: const EdgeInsets.all(0.0),
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.2,
                              color: Color.fromRGBO(128, 8, 12, 1),
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01,),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(0.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/lock.png',
                          ),
                        ),
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.3,
                              color: Color.fromRGBO(128, 8, 12, 1),
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01,),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/login.png',
                          ),
                        ),
                        hintText: 'Confirm you Password',
                        labelText: 'Confirm Password',
                        contentPadding: const EdgeInsets.all(0.0),
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(128, 8, 12, 1),
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01,),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/email.png',
                            width: screenWidth * 0.05,
                            height: screenHeight * 0.05,
                          ),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(0.0),
                        hintText: 'Enter Email Address',
                        labelText: 'Email Address',
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(128, 8, 12, 1),
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01,),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/UPI.png',
                            width: screenWidth * 0.05,
                            height: screenHeight * 0.05,
                          ),
                        ),
                        isDense: true,
                        hintText: 'Enter UPI Id',
                        labelText: 'UPI Id / Number',
                        contentPadding: const EdgeInsets.all(0.0),
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.2,
                              color: Color.fromRGBO(128, 8, 12, 1),
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.5,

                      padding: const EdgeInsets.only(left: 40.0, top : 40),
                      child: ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 15, 24, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0)
                          ),

                        ),
                        child: Text('SIGNUP' , style: GoogleFonts.orbitron(
                            color: Colors.white, fontSize: 17 ),),
                      )),
                ],
              ),
            ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}