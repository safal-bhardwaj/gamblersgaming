import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CreateAccountHost extends StatefulWidget{
  const CreateAccountHost({super.key});

  @override
  State<CreateAccountHost> createState() => _CreateAccountHostState();
}

class _CreateAccountHostState extends State<CreateAccountHost> {
  @override
  Widget build(context){
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
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
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(8,10,128,24),
                            blurRadius: 20,
                            spreadRadius: 5
                        )
                      ]
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(150, 150),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16.0)
                      ),
                      child : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Images/Gamer/user.png',
                            width: 70,
                            color: const Color.fromRGBO(8,10,128,24),
                          ),
                        ],
                      )
                  ),
                ),
                const SizedBox(height: 25,),
                Text('WELCOME', style: GoogleFonts.orbitron(
                    color: Colors.white, fontSize: 20)),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/name.png',
                            width: 18,
                            height: 18,
                          ),
                          ),
                        hintText: 'Enter your name',
                        labelText: 'Full Name',
                        contentPadding: const EdgeInsets.all(0.0),
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.8,
                              color: Color.fromRGBO(8,10,128,24),
                            )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/user1.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        hintText: 'Enter your name',
                        labelText: 'UserName',
                        contentPadding: const EdgeInsets.all(0.0),
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.2,
                              color: Color.fromRGBO(8,10,128,24),
                            )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(0.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/lock.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.3,
                              color: Color.fromRGBO(8,10,128,24),
                            )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/login.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        hintText: 'Confirm you Password',
                        labelText: 'Confirm Password',
                        contentPadding: const EdgeInsets.all(0.0),
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(8,10,128,24),
                            )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/email.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(0.0),
                        hintText: 'Enter Email Address',
                        labelText: 'Email Address',
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(8,10,128,24),
                            )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/UPI.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        hintText: 'Enter UPI Id',
                        labelText: 'UPI Id / Number',
                        contentPadding: const EdgeInsets.all(0.0),
                        labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white, fontSize: 14),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.2,
                              color: Color.fromRGBO(8,10,128,24),
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(

                    width: 200,
                      padding: const EdgeInsets.only(left: 40.0, top : 40),
                      child: ElevatedButton(

                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(19,15,255,24)  ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0)
                          ),
                          side: const BorderSide(
                            width: 1.0,
                            color: Color.fromRGBO(8,10,128,24),

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