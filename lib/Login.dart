import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/Verification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gamblersgaming/Icons/icons_icons.dart';


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

    return LayoutBuilder(builder: (ctx , constraints){

      final width = constraints.minWidth;
      final height = constraints.maxHeight;

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

                    //Profile Image
                    Container(
                      width: width < 500 ? screenWidth * 0.4 : screenWidth * 0.36,
                      height: height < 1000 ? screenHeight * 0.2 : screenHeight * 0.18,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(128, 8, 12,1),
                                blurRadius: 18,
                                spreadRadius: 5
                            )
                          ]
                      ),
                      child: ShaderMask(
                        shaderCallback: (Rect bounds){
                          return LinearGradient(
                              colors : [Color.fromRGBO(255, 15, 24, 1), Color.fromRGBO(0, 0, 0, 1)]
                              ).createShader(bounds);

                        },
                          child: Icon(Icons.person , size: width < 500 ? 70 : 100,)
                      )
                    ),

                    //Text


                    SizedBox(height: screenHeight * 0.05,),
                    Text('HEY! WELCOME',
                        style: GoogleFonts.orbitron(
                            color: Colors.white,
                            fontSize: width < 500 ? 16 : 20
                        )),
                    SizedBox(height: screenHeight * 0.03,),



                    //Phone Number


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 35,),

                        //+91 text
                        InkWell(
                          splashColor: Color.fromRGBO(255, 15, 24, 1),
                          onTap: (){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Sorry you can't change country code right now!",
                              style: TextStyle(
                                fontFamily: 'MSPGothic'
                              ),),));
                          },
                          child: Container(
                            width: screenWidth * 0.134,
                            margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Color.fromRGBO(128, 8, 12, 1), width: 1.2)

                              ),

                            ),
                            child: Padding(
                              padding:width < 500 && height < 1000 ?
                              EdgeInsets.fromLTRB(10, 8, 15, 12):
                              EdgeInsets.fromLTRB(20, 8, 20, 10) ,
                              child: Text("+91" , textAlign: TextAlign.center, style: TextStyle(
                                fontFamily: 'Orbitron',
                                fontSize: width < 500 ? 12 : 16

                              ),),
                            ),
                          ),
                        ),
                        //SizedBox(width: screenWidth * 0.02,),


                        //phone number input

                        Padding(
                          padding:width < 500 && height < 1000 ?
                          EdgeInsets.fromLTRB(0, 0 , 35 , 0) :
                          EdgeInsets.fromLTRB(0, 0 , 45 , 0) ,
                          child: SizedBox(
                            width: screenWidth * 0.6,
                            child: TextFormField(
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.2,
                                      color: Color.fromRGBO(255, 15, 24, 1),
                                    )
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Color.fromARGB(255, 128, 8, 12),
                                    )),
                                labelText: 'Phone Number',
                                labelStyle:
                                GoogleFonts.getFont('Orbitron',
                                    color: Colors.white,
                                  fontSize: width < 500 ? 14 : 19
                                ),

                              ),
                              onSaved: (value) {
                                _Phone = "+91"+value!;
                              },
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05,),
                    ElevatedButton(
                        onPressed: _sendOTP,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 15, 24),
                            //fixedSize: Size(screenWidth * 0.48, screenHeight * 0.03),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        child: Text('REQUEST OTP',
                            style: TextStyle(
                                fontFamily: 'MSPGothic',
                                color: Colors.white,
                                fontSize: width < 500 ? 14 : 20
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });

  }
}
