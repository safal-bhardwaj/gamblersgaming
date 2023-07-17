import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/CheckSignUP.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../create_account.dart';

final _firebase = FirebaseAuth.instance;

class LogInScreen extends StatefulWidget{
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  var _Phone = " ";
  var _OTP = "";

  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _OTPsent = false;
  var  _verify = "";
  var _isLoading = false;



  void _sendOTP() async
  {
    final isValid = _formKey.currentState!.validate();
    if(!isValid)
    {
      return;
    }
    _formKey.currentState!.save();
    print(_Phone);
    await _firebase.verifyPhoneNumber(
      phoneNumber: _Phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        _firebase.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async{

        setState(() {
          _OTPsent = true;

        });
        _verify = verificationId;

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }


  void  _submit () async{

    setState(() {
      _isLoading = true;

    });

    _formKey.currentState!.save();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verify, smsCode: _OTP);

    // Sign the user in (or link) with the credential
    await _firebase.signInWithCredential(credential);
    setState(() {
      _isLoading = false;

    });

    Navigator.push(context, MaterialPageRoute(builder: (context) =>CheckSignUP(phone: _Phone,) ));








    // final db = FirebaseFirestore.instance;
    // final docRef = db.collection("Users").doc("${_Phone}");
    // docRef.get().then(
    //       (DocumentSnapshot doc) {
    //     final data = doc.data() ;
    //     ok = doc.exists;
    //     print(ok);
    //     // ...
    //     if(!ok)
    //     {
    //       print(ok);
    //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> CreateAccount(phone: _Phone)));
    //
    //
    //     }
    //     else
    //     {
    //       print(ok);
    //
    //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> BottomNavigation()));
    //     }

    //   },
    //   onError: (e){  print("Error getting document: $e");
    //         },
    // );
    //
    // print(ok);




  }


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
          child:  _isLoading ? const CircularProgressIndicator(color:
          Color.fromRGBO(255, 15, 24, 1), backgroundColor: Colors.white,) :
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, keyboardSpace),
              child: Form(
                key : _formKey,
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
                    Text('HEY! WELCOME',
                        style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: 20)),
                    SizedBox(height: screenHeight * 0.03,),
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color.fromARGB(255, 128, 8, 12),
                            )
                          ),
                          labelText: 'Phone No.',
                          labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white),
                        ),
                      keyboardType: TextInputType.phone ,
                      validator:(value)
                        {
                          if(value==null)
                            {
                              return 'enter valid value';
                            }
                        },
                        onSaved: (value){
                            _Phone = value!;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02,),
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: !_OTPsent? null :
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 128, 8, 12),
                                )
                            ),
                            labelText: 'OTP',
                            labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white),
                        ),
                        onSaved: (value){
                          _OTP = value!;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05,),
                    ElevatedButton(
                        onPressed: _OTPsent ? _submit : _sendOTP,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 15, 24),
                            fixedSize: Size(screenWidth * 0.48, screenHeight * 0.03),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0)
                            )
                        ),
                        child: Text(_OTPsent ? 'Verify' : 'Send OTP' , style: TextStyle(
                            fontFamily: 'MSPGothic',
                            color: Colors.white,
                          fontSize: 20
                        ))
                    ),
                    SizedBox(height: screenHeight * 0.03,),

                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}