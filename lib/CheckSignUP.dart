import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'BottomNavigation.dart';
import 'create_account.dart';

class CheckSignUP extends StatefulWidget {

  final String? phone;

  const CheckSignUP({Key? key, this.phone})
      : super(key: key);

  @override
  State<CheckSignUP> createState() => _CheckSignUPState();

}

class _CheckSignUPState extends State<CheckSignUP> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isLoading = true;

  Future<bool> checkIfDocumentExists(String documentId) async {
    final DocumentSnapshot documentSnapshot =
    await FirebaseFirestore.instance.collection('Users')
        .doc(documentId)
        .get();
    return documentSnapshot.exists;
  }

  void navigateToCreateAccount(String phone) {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => CreateAccount(phone: phone,)),
    );
  }
  void navigateToBottomNav() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => BottomNavigation()),
    );
  }

  Future<void> checkDocumentExistence(String phone) async {
    final bool documentExists = await checkIfDocumentExists(phone);
    print(phone);
    print(documentExists);
    if (documentExists) {
      navigateToBottomNav();
    }
    else
    {
      navigateToCreateAccount(phone);
    }
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkDocumentExistence(widget.phone!);
    _isLoading = false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(""),
    backgroundColor:const Color.fromRGBO(0, 0, 0, 0),
    ),
    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
    body: Center(
    child:  _isLoading ? const CircularProgressIndicator(color:
    Color.fromRGBO(255, 15, 24, 1), backgroundColor: Colors.white,) : null
    ));
  }
}
