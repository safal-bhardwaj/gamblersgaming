import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/CheckSignUP.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'Login.dart';
//import 'Login.dart';

final _firebase = FirebaseAuth.instance;

class Verification extends StatefulWidget {
  final String? phone;



    const Verification({Key? key, this.phone})
      : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  final _formKey = GlobalKey<FormState>();
  String _OTP = "";

  void  _submit () async {
    _formKey.currentState!.save();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: Login.verify, smsCode: _OTP);

    // Sign the user in (or link) with the credential
    await _firebase.signInWithCredential(credential);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CheckSignUP(phone: widget.phone,)));
  }



  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(128, 8, 12, 1)),
        borderRadius: BorderRadius.circular(13),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
      borderRadius: BorderRadius.circular(13),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor:const Color.fromRGBO(0, 0, 0, 0),
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: Center(
        child:
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, keyboardSpace),
            child: Form(
              key: _formKey,
              child: Column(
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
                  Text('Enter OTP',
                      style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 20)),
                  SizedBox(height: screenHeight * 0.03,),
                  Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    // validator: (s) {
                    //   return s == '2222' ? null : 'Pin is incorrect';
                    // },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (value){
                      _OTP = value!;
                    },
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     enabledBorder: const UnderlineInputBorder(
                  //         borderSide: BorderSide(
                  //           width: 1.5,
                  //           color: Color.fromARGB(255, 128, 8, 12),
                  //         )
                  //     ),
                  //     labelText: 'OTP',
                  //     labelStyle: GoogleFonts.getFont('Orbitron', color: Colors.white),
                  //   ),
                  //   onSaved: (value){
                  //     _OTP = value!;
                  //   },
                  //   keyboardType: TextInputType.number,
                  // ),


              SizedBox(height: screenHeight * 0.05,),
              ElevatedButton(
                  onPressed:_submit,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 15, 24),
                      fixedSize: Size(screenWidth * 0.48, screenHeight * 0.03),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)
                      )
                  ),
                  child: Text('Verify'  , style: TextStyle(
                      fontFamily: 'MSPGothic',
                      color: Colors.white,
                      fontSize: 20
                  ))
              ),
                      ],
              ),
            ),
          )
        ),
      ),
    );

  }

}



