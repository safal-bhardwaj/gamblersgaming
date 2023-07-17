import 'package:flutter/material.dart';
import 'package:gamblersgaming/create_account.dart';
import 'package:gamblersgaming/Gamer/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class AccountScreen extends StatelessWidget{
  const AccountScreen({super.key});

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor:const Color.fromRGBO(0, 0, 0, 10),
      ),
        body: Container(
          width: screenWidth * 1,
          height: screenHeight * 1,
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/Gamer/GG_BG2.png'),
            fit: BoxFit.fill,
          )
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/Images/GGLogo.png',
                width: screenWidth * 0.3,
                height: screenHeight * 0.1,),
              SizedBox(height: screenHeight * 0.01,),
              //UserIcon
              Column(
                children: [
                  Container(
                    width: screenWidth * 0.36,
                    height: screenHeight * 0.18,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 128, 8, 12),
                              blurRadius: 25,
                              spreadRadius: 6
                          )
                        ]
                    ),
                    alignment: Alignment.center,
                    child: Image.asset('assets/Images/Gamer/user.png', width: screenWidth * 0.2, height: screenHeight * 0.1,),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.06,),
              SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth * 0.5,
                child: Text('WELCOME',
                    textAlign: TextAlign.center
                    ,style: GoogleFonts.orbitron(
                    color: Colors.white, fontSize: 20)),
              ),
              SizedBox(height: screenHeight * 0.03,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LogInScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 15, 24),
                    fixedSize: Size(screenWidth * 0.5, screenHeight * 0.05),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    )
                  ),
                  child: const Text('LOGIN' , style: TextStyle(
                      fontFamily: 'MSPGothic',
                      color: Colors.white,
                    fontSize: 15
                  ))
              ),
              SizedBox(height: screenHeight * 0.03,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateAccount()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
                      fixedSize: Size(screenWidth * 0.5, screenHeight * 0.05),
                      side: const BorderSide(color: Color.fromARGB(255, 128, 8, 12), width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                      )
                  ),
                  child: const Text('CREATE AN ACCOUNT' , style: TextStyle(
                    fontFamily: 'MSPGothic',
                    color: Colors.white
                  ))
              ),
              SizedBox(height: screenHeight * 0.15,)
            ],
          ),
        ),
      ),
    );
  }
}