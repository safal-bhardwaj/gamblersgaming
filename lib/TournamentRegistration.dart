import 'package:flutter/material.dart';
import 'package:gamblersgaming/NewTournament.dart';
import 'package:gamblersgaming/HomeScreen.dart';


class TournamentRegistration extends StatefulWidget{
  @override

  TournamentRegistration({Key? key, required this.Tournament}) : super(key: key);
  Map<String, dynamic> Tournament;
  State<TournamentRegistration> createState() => _TournamentRegistrationState();
}

class _TournamentRegistrationState extends State<TournamentRegistration> {


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx , constraints){
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      final width = constraints.minWidth;
      final height = constraints.maxHeight;
      return Scaffold(
        body: Column(
          children: [
            Row(
              children: [


                //User name

                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 6),
                  child: Text(
                    "User's Name",
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: width < 500 ? 10 : 14,
                    ),
                  ),
                ),

                //Chips in account
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "1000",
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                          fontSize: width < 500 ? 10: 14,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01,),
                      Image.asset(
                        'assets/Images/chips.png',
                        width: width < 500 ? screenWidth * 0.03 : screenWidth * 0.04,
                      )
                    ],
                  ),
                ))
              ],
            ),


            //Enter Game UserName
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.01, screenHeight * 0.05,
                  screenWidth * 0.01, 0),
              child: Column(
                children: [
                  SizedBox(
                    width : screenWidth * 0.7,
                    child: Text("Enter Your \"Game\" Username :",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'MSPGothic',
                          fontSize: width < 500 ? 13 : 17

                      ),),
                  ),

                  SizedBox(height: screenHeight * 0.01,),

                  SizedBox(
                    width: screenWidth * 0.7 ,
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        color: const Color.fromRGBO(255, 15, 24, 1),
                        letterSpacing: 2,
                        fontSize: width < 500 ? 9 : 13,
                      ),
                      //controller: _titlecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'Username',
                          hintStyle:  TextStyle(
                            fontFamily: 'Orbitron',
                            fontSize: width < 500 ? 9 : 13,
                            color: const Color.fromRGBO(128, 8, 12, 1),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.all(10.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fillColor: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  //Conditions.

                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.85,

                    decoration: BoxDecoration(
                      color: Color.fromRGBO(190, 223, 233, 1),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.info_outlined, color: Colors.black,),
                          Padding(
                            padding: EdgeInsets.only(left: 8,),
                            child: Column(
                              children: [
                                Text("\"Game Name\” should be exactly same as the one you\n are having in " + widget.Tournament['Game'] + ".",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width < 500 ? 13 : 16,
                                    fontFamily: 'MSPGothic'

                                  ),
                                    ),
                                SizedBox(height: screenHeight * 0.004,),
                                Text("By Clicking the button below you agrees to terms & \ncondition by Gambler’s Gaming.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width < 500 ? 13 : 16,
                                    fontFamily: 'MSPGothic'

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),


                  //Register Button

                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  SizedBox(
                    width: screenWidth * 0.5,
                    height : screenHeight * 0.03,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                      ),
                      child: Text(
                        'Pay ' + widget.Tournament['Registration Fee'].toString() + ' Chips and Register',
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                          fontSize: width < 500 ? 10 : 15,
                        ),
                      ),
                    ),
                  ),

                  // Cancel Button
                  //
                  //
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     icon: const Icon(
                  //       Icons.close_rounded,
                  //       color: Color.fromRGBO(255, 15, 24, 1),
                  //     )),

                ],
              ),
            ),




          ],
        ),



        floatingActionButton: Visibility(
          visible: true,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            transform:
            width < 500 ? Matrix4.translationValues(0.0, -63, 0.0)   :
            Matrix4.translationValues(0.0, -75, 0.0), // translate up by 30
            child: CircleAvatar(
              backgroundImage: AssetImage(widget.Tournament['Game_Image']),
              radius: width < 500 ? 53 : 65,
            ),
          ),
        ),
        // dock it to the center top (from which it is translated)
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      );
    });

  }
}
