import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatelessWidget{
  const LoadingScreen({super.key});

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 10),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitFadingCircle(
              color: const Color.fromRGBO(128, 8, 12, 10),
              size: screenWidth * 0.2,
              //duration: const Duration(milliseconds: 3000),
            ),
          ],
        ),
      ),
    );
  }

}