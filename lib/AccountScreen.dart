import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/Help.dart';


class Account_Screen extends StatefulWidget{
  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx , constraints){
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      final width = constraints.minWidth;
      final height = constraints.maxHeight;


      return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 10),
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: screenHeight * 0.3,
                  child: Image.asset('assets/Images/wallpaper.jpg'),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(8, screenHeight * 0.22, screenWidth * 0.6, 0),
                  child: Container(
                    width: screenWidth * 0.3,
                      height: screenWidth * 0.3,
                      child: const CircleAvatar(backgroundImage: AssetImage('assets/Images/bgmi.jpg'), )),
                ),
                
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.32, screenHeight * 0.23, 0, 0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Spydie", style:TextStyle(
                            fontFamily: 'Orbitron',
                            fontSize: width < 500 ? 15 : 18,
                          ),),
                          SizedBox(height: screenHeight * 0.02,),
                          Text("UPI_ID", style:TextStyle(
                            fontFamily: 'MSPGothic',
                            fontSize: width < 500 ? 13 : 16,
                          ),)
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right : 12, top: 20),
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
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.32, screenHeight*0.32, 0, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        height : screenHeight * 0.03,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                          child: Text('Redeem Chips',
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: width < 500 ? 10 : 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03,),
                      SizedBox(
                        width: screenWidth * 0.3,
                        height : screenHeight * 0.03,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                          child: Text('Purchase Chips',
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: width < 500 ? 10 : 15,
                              color: const Color.fromRGBO(255, 15, 24, 10)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: screenHeight * 0.07,),


            //Edit Profile
            Container(
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(20, 20, 20, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 8, top: 8),
                child: Row(
                  children: [
                    const Icon(Icons.edit, color: Colors.white),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20,0,0,0),
                          child: Text(
                            'Edit Profile',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'MSPGothic',
                              fontSize: 15,
                              // Align text to the left
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01,),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20,0,0,0),
                          child: Text(
                            'Change your name, profile picture, UPI Id, \nEmail Id, etc.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'MSPGothic',
                              fontSize: 10,
                              color: Color.fromRGBO(191, 191, 191, 1)
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: screenWidth * 0.1,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Image.asset('assets/Images/rightarrow.png', width: screenWidth * 0.05,),
                    ),


                  ],
                )

              ),
            ),



            SizedBox(height: screenHeight * 0.04,),



            //Hosted Tournaments



            Container(
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(20, 20, 20, 1),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 8, top: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.flag_outlined, color: Colors.white),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text(
                              'Hosted Tournaments',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'MSPGothic',
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01,),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text(
                              'Your previous hosted tournaments.',
                              textAlign: TextAlign.left,

                              style: TextStyle(
                                fontFamily: 'MSPGothic',
                                fontSize: 10,
                                color: Color.fromRGBO(191, 191, 191, 1),

                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.1,),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Image.asset('assets/Images/rightarrow.png', width: screenWidth * 0.05,),
                      ),


                    ],
                  )

              ),
            ),


            //Participated Tournaments

            SizedBox(height: screenHeight * 0.04),

            Container(
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(20, 20, 20, 1),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 8, top: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.sports_esports_outlined, color: Colors.white),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text(
                              'Participated Tournaments',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'MSPGothic',
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01,),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text(
                              'Your previous participated tournaments.',
                              textAlign: TextAlign.left,

                              style: TextStyle(
                                fontFamily: 'MSPGothic',
                                fontSize: 10,
                                color: Color.fromRGBO(191, 191, 191, 1),

                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.1,),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Image.asset('assets/Images/rightarrow.png', width: screenWidth * 0.05,),
                      ),


                    ],
                  )

              ),
            ),



            //Help Desk

            SizedBox(height: screenHeight * 0.04),

            InkWell(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HelpScreen()));},
              child: Container(
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(20, 20, 20, 1),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8, top: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.call_outlined, color: Colors.white),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20,0,0,0),
                              child: Text(
                                'Help Desk',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'MSPGothic',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01,),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20,0,0,0),
                              child: Text(
                                'Feel free to contact.',
                                textAlign: TextAlign.left,

                                style: TextStyle(
                                  fontFamily: 'MSPGothic',
                                  fontSize: 10,
                                  color: Color.fromRGBO(191, 191, 191, 1),

                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenWidth * 0.1,),
                        Padding(
                          padding:  EdgeInsets.only(left: screenWidth * 0.27),
                          child: Image.asset('assets/Images/rightarrow.png', width: screenWidth * 0.05,),
                        ),


                      ],
                    ),

                ),
              ),
            ),


            //Log Out

            SizedBox(height: screenHeight * 0.05),
            SizedBox(
              width: screenWidth * 0.35,
              height : screenHeight * 0.03,
              child: ElevatedButton(
                onPressed: (){FirebaseAuth.instance.signOut();},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: width < 500 ? 10 : 15,
                  ),
                ),
              ),
            ),






          ],
        ),
      );
    }
    );
  }
}