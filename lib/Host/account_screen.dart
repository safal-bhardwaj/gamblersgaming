import 'package:flutter/material.dart';
import 'package:gamblersgaming/Host/create_account.dart';
import 'package:gamblersgaming/Host/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
class AccountScreenHost extends StatelessWidget{
  const AccountScreenHost({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor:Color.fromRGBO(0, 0, 0, 1),
      ),
        body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/GG_BG1.png'),
            fit: BoxFit.cover,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(8,10,128,24),
                              blurRadius: 15,
                              spreadRadius: 4
                          )
                        ]
                    ),
                    child: Container(alignment: Alignment.center,child: Image.asset('assets/Images/Host/user_host.png',width: 70,height:70,fit: BoxFit.fitHeight,)),
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              Text('WELCOME', style: GoogleFonts.orbitron(
                  color: Colors.white, fontSize: 20)),
              const SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogInScreenHost()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(19, 15, 255, 24),
                    fixedSize: const Size(220, 50),
                    side: const BorderSide(color: Color.fromRGBO(19, 15, 255, 24), width: 0.5),
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateAccountHost()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: const Size(220, 50),
                      side: const BorderSide(color: Color.fromRGBO(8,10,128,24), width: 1),
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