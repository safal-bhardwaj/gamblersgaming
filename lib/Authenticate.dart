import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Gamer/login_screen.dart';
import 'Home.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges() ,
      builder: (context, snapshot) {

        if(snapshot.hasData)
        {

          return const HomeScreen();
        }
        else
        {
          return const LogInScreen();
        }
      },));
  }
}
