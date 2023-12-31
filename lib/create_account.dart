import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/BottomNavigation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:email_validator/email_validator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class CreateAccount extends StatefulWidget {

  final String? phone;

  const CreateAccount({Key? key, this.phone})
      : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {


  File? _pickedImageFile;
  String _pickedImagePath = "";
  final _formKey2 = GlobalKey<FormState>();
  var _isUploading = false;

  // data vars

  String _username = "";
  String _email = "";
  String _UPI = "";
  String _age= "";
  String? _currentAddress;
  Position? _currentPosition;
  var result = {};
  var _pickedImageWidget ;

  //functions

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera, maxWidth: 1000, maxHeight: 2000);
    if (pickedImage == null)
      return;
    setState (() async {
      _pickedImagePath = pickedImage.path;
      _pickedImageFile = File(_pickedImagePath);

    });
  }

  void _signUP() async
  {
    final isValid = _formKey2.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey2.currentState!.save();
    setState(() {
      _isUploading = true;
    });
    // final storageRef = FirebaseStorage.instance.ref()
    //     .child('User_Images')
    //     .child('${widget.phone}.jpg');
    // await storageRef.putFile(_pickedImageFile!);
    // final _imageURL = await storageRef.getDownloadURL();

    await _getCurrentPosition();

    await FirebaseFirestore.instance
        .collection('Users')
        .doc('${widget.phone}')
        .set({
      'Username' : _username,
      'Image-Url' : "" ,
      'E-mail' : _email,
      'UPI-ID' : _UPI,
      'Loacation' : _currentAddress,
      'Age' : _age,
        });

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const BottomNavigation()));
  }
 //Location function


  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    print(1);
    permission = await Geolocator.checkPermission();
    print(2);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print(3);
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    print(4);
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    print(5);
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async{
      print(6);
      setState(() => _currentPosition = position);
      print(7);
      await _getAddressFromLatLng(_currentPosition!);
      print(8);
      return;

    }).catchError((e) {
      print("error");
      return;
    });
  }
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.locality},${place.subAdministrativeArea}, ${place.administrativeArea},${place.country}';
      });
    }).catchError((e) {
      return;
    });
  }


  @override
  Widget build(context) {
    final keyboardSpace = MediaQuery
        .of(context)
        .viewInsets
        .bottom;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return LayoutBuilder(builder: (ctx , constraints){
      final width = constraints.minWidth;
      final height = constraints.maxHeight;
      return Scaffold(
        appBar: AppBar(
          title: const Text(""),
          backgroundColor: const Color.fromRGBO(0, 0, 0, 10),
        ),
        backgroundColor: const Color.fromRGBO(0, 0, 0, 10),
        body: Center(
          child: _isUploading
              ? const CircularProgressIndicator(color:
          Color.fromRGBO(255, 15, 24, 1), backgroundColor: Colors.white,)
              : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, keyboardSpace),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth * 0.36,
                    height: screenHeight * 0.18,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(128, 8, 12, 1),
                              blurRadius: 18,
                              spreadRadius: 5
                          )
                        ]
                    ),
                    child:
                    ElevatedButton(
                        onPressed: _pickImage,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: Size(
                              screenWidth * 0.36, screenHeight * 0.18,),
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(16.0)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            _pickedImageFile == null ? Image.asset(

                              'assets/Images/gallery.png',
                              width: screenWidth * 0.2, height: screenHeight *
                                0.1,
                              color: const Color.fromRGBO(128, 8, 12, 1),
                              fit: BoxFit.cover,
                            ) :
                            _pickedImageWidget
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03,),




                  SizedBox(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.03,
                    child: Text('WELCOME', textAlign: TextAlign.center,
                        style: GoogleFonts.orbitron(
                            color: Colors.white, fontSize:width < 500 ? 15 : 20)),
                  ),
                  SizedBox(height: screenHeight * 0.02,),


                  //form

                  Form(
                    key: _formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: screenWidth * 0.6,
                          child: TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              alignLabelWithHint: true,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(Icons.person_outline_outlined, size: width < 500 ? 22 : 25, color: Colors.white,)

                              ),
                              hintText: 'Enter your Name',
                              labelText: 'Your Name',
                              contentPadding: const EdgeInsets.all(0.0),
                              labelStyle: GoogleFonts.getFont(
                                  'Orbitron', color: Colors.white, fontSize: width < 500 ? 13 : 14),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: Color.fromRGBO(255, 15, 24, 1),
                                  )
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: Color.fromRGBO(128, 8, 12, 1),
                                  )
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.trim() == "")
                                return "This field can't be null!";
                            },
                            onSaved: (value) {
                              _username = value!;
                            },
                          ),

                        ),
                        SizedBox(height: screenHeight * 0.01,),

                        SizedBox(
                          width: screenWidth * 0.6,
                          child: TextFormField(
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              prefixIcon: Padding(
                                padding: width < 500 ?  EdgeInsets.fromLTRB(9,20, 9,0) : EdgeInsets.fromLTRB(9,9,9,0),
                                child: Image.asset(
                                  'assets/Images/email.png',
                                  width: width < 500 ? screenWidth * 0.001 :  screenWidth * 0.05,
                                  height: height < 1000 ? screenHeight * 0.001 : screenHeight * 0.05,
                                ),
                              ),
                              //isDense: true,
                              hintText: 'Enter Email Address',
                              labelText: 'Email Address',
                              labelStyle: GoogleFonts.getFont(
                                  'Orbitron', color: Colors.white, fontSize: width < 500 ? 13 : 14),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: Color.fromRGBO(255, 15, 24, 1),
                                  )
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(128, 8, 12, 1),
                                  )
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim() == "")
                                return "This field can't be null!";
                              bool isvalid = EmailValidator.validate(value);
                              if (!isvalid) return "Enter a valid Email!";
                            },
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01,),
                        SizedBox(
                          width: screenWidth * 0.6,
                          child: TextFormField(
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              prefixIcon: Padding(
                                padding: width < 500 ?  EdgeInsets.fromLTRB(9,17,9,0) : EdgeInsets.fromLTRB(9,9,9,0),
                                child: Image.asset(
                                  'assets/Images/UPI.png',
                                  width: width < 500 ? screenWidth * 0.001 : screenWidth * 0.05,
                                  height:height < 500 ? screenHeight * 0.001 : screenHeight * 0.05,
                                ),
                              ),
                              hintText: 'Enter UPI Id',
                              labelText: 'UPI Id / Number',

                              labelStyle: GoogleFonts.getFont(
                                  'Orbitron', color: Colors.white, fontSize: width < 500 ? 13 : 14),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: Color.fromRGBO(255, 15, 24, 1),
                                  )
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: Color.fromRGBO(128, 8, 12, 1),
                                  )
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim() == "")
                                return "This field can't be null!";
                            },
                            onSaved: (value) {
                              _UPI = value!;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01,),
                        SizedBox(
                          width: screenWidth * 0.6,
                          child: TextFormField(
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              prefixIcon: Padding(
                                  padding:width < 500 ?  EdgeInsets.fromLTRB(9,17,9,0) : EdgeInsets.fromLTRB(9,9,9,0),
                                child: Icon(Icons.onetwothree_outlined, size: width < 500 ? 30 : 35, color: Colors.white,)

                              ),
                              //isDense: true,
                              hintText: 'Enter Your Age ',
                              labelText: 'Your Age',
                              labelStyle: GoogleFonts.getFont(
                                  'Orbitron', color: Colors.white, fontSize: width < 500 ? 13 :14),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: Color.fromRGBO(255, 15, 24, 1),
                                  )
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.2,
                                    color: Color.fromRGBO(128, 8, 12, 1),
                                  )
                              ),
                            ),
                            keyboardType: TextInputType.number
                            ,
                            validator: (value) {
                              if (value == null || value.trim() == "")
                                return "This field can't be null!";
                            },
                            onSaved: (value) {
                              _age = value!;
                            },
                          ),
                        ),


                        //Signup button


                        Container(
                            width: screenWidth * 0.45,
                            height: screenHeight *0.1,

                            padding: const EdgeInsets.only(left: 40.0, top: 40),
                            child: ElevatedButton(
                              onPressed: () {
                                // if (_pickedImagePath == "") {
                                //   const snackBar = SnackBar(
                                //     content: Text('Upload Image and Retry!',
                                //       style: TextStyle(fontFamily: 'MSPGothic'),),
                                //     backgroundColor: Colors.white,
                                //   );
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       snackBar);
                                //   return;
                                // }
                                _signUP();
                              },
                              style: ElevatedButton.styleFrom(

                                backgroundColor: const Color.fromRGBO(
                                    255, 15, 24, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                ),

                              ),
                              child: Text('SIGNUP', style: GoogleFonts.orbitron(
                                  color: Colors.white, fontSize: width < 500 ? 14 : 20),),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });

  }
}