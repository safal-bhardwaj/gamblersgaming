import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/Verification.dart';
import 'package:google_fonts/google_fonts.dart';


final _firebase = FirebaseAuth.instance;


class Login extends StatefulWidget {
  const Login({super.key});
  static String verify="";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _Phone = "";
  final _formKey = GlobalKey<FormState>();


  //functions

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

        Login.verify = verificationId;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Verification(phone: _Phone)));

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          )),
                          labelText: 'Phone Number',
                          labelStyle:
                              GoogleFonts.getFont('Orbitron', color: Colors.white),
                        ),
                        onSaved: (value) {
                          _Phone = value!;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05,),
                    ElevatedButton(
                        onPressed: _sendOTP,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 15, 24),
                            //fixedSize: Size(screenWidth * 0.48, screenHeight * 0.03),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0))),
                        child: Text('Send OTP',
                            style: TextStyle(
                                fontFamily: 'MSPGothic',
                                color: Colors.white,
                                fontSize: 20))),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
