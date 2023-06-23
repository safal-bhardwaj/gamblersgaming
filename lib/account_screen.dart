import 'package:flutter/material.dart';
import 'package:gamblersgaming/create_account.dart';
import 'package:gamblersgaming/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class AccountScreen extends StatelessWidget{
  const AccountScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor:Color.fromRGBO(0, 0, 0, 10),
      ),
        body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/GG_BG1.png'),
            fit: BoxFit.fill,
          )
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/Images/GGLogo.png', width: 150,),
              const SizedBox(height: 10,),
              //UserIcon
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 255, 15, 24),
                              blurRadius: 15,
                              spreadRadius: 4
                          )
                        ]
                    ),
                    child: Image.asset('assets/Images/user.png', alignment: Alignment.bottomCenter,),
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              Text('WELCOME', style: GoogleFonts.orbitron(
                  color: Colors.white, fontSize: 20)),
              const SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogInScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(220, 50),
                    side: const BorderSide(color: Color.fromARGB(255, 255, 15, 24), width: 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    )
                  ),
                  child: const Text('LOGIN' , style: TextStyle(
                      fontFamily: 'MSPGothic',
                      color: Colors.white
                  ))
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateAccount()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: const Size(220, 50),
                      side: const BorderSide(color: Color.fromARGB(255, 255, 15, 24), width: 0.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                      )
                  ),
                  child: const Text('CREATE AN ACCOUNT' , style: TextStyle(
                    fontFamily: 'MSPGothic',
                    color: Colors.white
                  ))
              ),
              const SizedBox(height: 120,)
            ],
          ),
        ),
      ),
    );
  }
}