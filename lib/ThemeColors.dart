import 'package:flutter/material.dart';
class ImageCheck extends StatelessWidget{
  const ImageCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 600,
          height: 300,
          child: Image.asset('assets/Images/Gamer/user.png',
            alignment: Alignment.center,
            ),
        ),
      )
    );
  }

}