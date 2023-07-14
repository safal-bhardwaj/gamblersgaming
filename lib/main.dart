import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/Gamer/create_account.dart';
import 'package:gamblersgaming/Gamer/login_screen.dart';
import 'package:gamblersgaming/Home.dart';
import 'package:gamblersgaming/Splash.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'BottomNavigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BottomNavigation(),
    );
  }
}



