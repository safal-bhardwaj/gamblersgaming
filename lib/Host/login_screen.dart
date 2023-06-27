import 'package:flutter/material.dart';
import 'package:gamblersgaming/Host/create_account.dart';

import 'package:google_fonts/google_fonts.dart';

//import 'create_account.dart';
class LogInScreenHost extends StatefulWidget{
  const LogInScreenHost({super.key});

  @override
  State<LogInScreenHost> createState() => _LogInScreenHostState();
}

class _LogInScreenHostState extends State<LogInScreenHost> {

  var _isLogin = true;



  @override
  Widget build(context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor:Color.fromRGBO(0, 0, 0, 0),
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, keyboardSpace),
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
                                color: Color.fromRGBO(8,10,128,24),
                                blurRadius: 18,
                                spreadRadius: 5
                            )
                          ]
                      ),
                      child: Container(alignment: Alignment.center,child: Image.asset('assets/Images/Host/user_host.png',width: 70,height:70,fit: BoxFit.fitHeight,)),
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
                          color: Color.fromRGBO(8,10,128,24),
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
                              color: Color.fromRGBO(8,10,128,24),
                            )
                        ),
                        labelText: 'Password',
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(19, 15, 255, 24),
                        fixedSize: const Size(150, 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    child: Text(_isLogin ? 'LOGIN' : 'SIGNUP' , style: TextStyle(
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
                    onPressed: () {
                      setState(() {
                        _isLogin = _isLogin? false : true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: const Size(200, 35),
                        side: const BorderSide(color: Color.fromRGBO(8,10,128,24), width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    child: Text( _isLogin ? 'Create Account' : 'LOGIN' , style: TextStyle(
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