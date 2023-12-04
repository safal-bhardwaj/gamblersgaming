import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        children: [
          SizedBox(height: 10,),
          ContactUs(
            companyName: 'Fulltime UnderGround Gaming',
            companyFont: 'MSPGothic',
            companyFontSize: 25,
            textColor: Colors.white,
            textFont: 'MSPGothic',
            email: 'sansritisharma004@gmail.com',
            emailText:'sansritisharma004@gmail.com' ,
            cardColor: Color.fromRGBO(20, 20, 20, 1),
            companyColor: Color.fromRGBO(255, 15, 24, 1),
            phoneNumber: "+919610350572",
            phoneNumberText: "+919610350572",
            taglineColor: Colors.black,
            dividerThickness: 0,
            dividerColor: Color.fromRGBO(125, 8, 12, 1),


          ),
        ],
      ),
    );
  }
}
