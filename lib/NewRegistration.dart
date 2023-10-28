import 'package:flutter/material.dart';
import 'package:gamblersgaming/NewTournament.dart';
class NewRegistration extends StatefulWidget{
  @override
  State<NewRegistration> createState() => _NewRegistrationState();
}

class _NewRegistrationState extends State<NewRegistration> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: true,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          transform:
          Matrix4.translationValues(0.0, -75, 0.0), // translate up by 30
          child: CircleAvatar(
            //backgroundImage: AssetImage(img[_showimg]),
            radius: 65,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}