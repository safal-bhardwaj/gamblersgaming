import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tournament_Screen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Tournament_Screen({Key? key, required this.Tournament}) : super(key: key);
  // ignore: non_constant_identifier_names
  Map<String, dynamic> Tournament;
  final formatter = DateFormat.yMMMMd('en_US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(
            20,
            20,
            20,
            1,
          ),
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(128, 8, 12, 1), //change your color here
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body:

            // Whole search container
        
        
            Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                
                // Image Container

                Container(
                    child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(13),
                      bottomRight: Radius.circular(13)),
                  child: Image.asset(
                    Tournament['Game_Image'],
                    fit: BoxFit.cover,
                  ),
                )),

                
                // Title + Participants count Container

                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Color.fromRGBO(128, 8, 12, 1))),
                    ),
                    child:


                     // Title


                    Row(
                      children: [
                        Text(
                          Tournament['Title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Orbitron',
                          ),
                          textAlign: TextAlign.start,
                        ),



                        // Participants Count


                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.people,
                                color: Color.fromRGBO(128, 8, 12, 1),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${Tournament["Participants"].length}/${Tournament["Game"] == "Asphalt" ? 8 : 100}",
                                style: const TextStyle(
                                    fontSize: 16, fontFamily: "MSPGothic"),
                              ),
                              //SizedBox(width: 3,),
                            ],
                          ),
                        ),
                      ],
                    )),



                // First Row for Details(i.e. Date , Time , Entry Fee)



                 Padding(padding: EdgeInsets.all(10) ,
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                    //Date Column

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Date', textAlign: TextAlign.end, style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                              "MSPGothic",
                              color: Color.fromRGBO(
                                  128, 8, 12, 1)),),
                          Text("${formatter.format(DateTime.fromMillisecondsSinceEpoch(Tournament["Date"].seconds * 1000))}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily:
                                "orbitron"),)
                        ],
                      ),
                    ),

                    // Time Column

                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Time',style: TextStyle(
                           fontSize: 16,
                           fontFamily:
                           "MSPGothic",
                           color: Color.fromRGBO(
                               128, 8, 12, 1)),),
                          Text(
                            Tournament["Time"],
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily:
                                "orbitron"),
                          )
                        ],
                    ),
                     ),

                    // Registration Fee Column

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Registration Fee',style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                              "MSPGothic",
                              color: Color.fromRGBO(
                                  128, 8, 12, 1)),),
                          Text(
                            Tournament["Registration Fee"].toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily:
                                "orbitron"),
                          )
                        ],
                      ),
                    )


                  ],)
                  ,),



                // Second Row for Details(Map , Perspective and  Team)


                Padding(padding: EdgeInsets.all(10) ,
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      //Map Column

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Map', textAlign: TextAlign.end,style: TextStyle(
                                fontSize: 16,
                                fontFamily:
                                "MSPGothic",
                                color: Color.fromRGBO(
                                    128, 8, 12, 1)),),
                            Text('Null',
                                style: const TextStyle(
                                fontSize: 14,
                                fontFamily:
                                "orbitron"),)
                          ],
                        ),
                      ),

                      // Perspective Column

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Perspective',style: TextStyle(
                                fontSize: 16,
                                fontFamily:
                                "MSPGothic",
                                color: Color.fromRGBO(
                                    128, 8, 12, 1)),),
                            Text(
                              "null",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily:
                                  "orbitron"),
                            )
                          ],
                        ),
                      ),

                      // Team Fee Column

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Team',style: TextStyle(
                                fontSize: 16,
                                fontFamily:
                                "MSPGothic",
                                color: Color.fromRGBO(
                                    128, 8, 12, 1)),),
                            Text(
                              "null",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily:
                                  "orbitron"),
                            )
                          ],
                        ),
                      )


                    ],)
                  ,),


                // Prize Pool Distribution


                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(12,50, 0, 0),
                    child: RichText(text: TextSpan(text: 'PrizePool',style: TextStyle(color: Color.fromRGBO(255, 15, 24, 1) , fontFamily: 'Orbitron',fontSize: 16)  ,
                        children: [TextSpan(text: 'Breakdown', style: TextStyle(color: Colors.white,fontFamily: 'Orbitron',fontSize: 16))]),),
                  ),
                ),


                // Prizes Rows


                Column(

                  children: [

                  //Rank 1
                    SizedBox(width: 20,height: 20),

                  Row(

                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Rank 1'),
                      SizedBox(width: 230),
                      Text('1000'),
                      Image.asset(
                        'assets/Images/chips.png',
                        width: 10,
                      ),
                    ],
                  ),

                  //Rank 2

                    SizedBox(width: 20,height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Rank 2'),
                      SizedBox(width: 230),
                      Text('1000'),
                      Image.asset(
                        'assets/Images/chips.png',
                        width: 10,
                      ),
                    ],
                  ),

                  //Rank 3

                    SizedBox(width: 20,height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Rank 3'),
                      SizedBox(width: 230),
                      Text('1000',textAlign: TextAlign.right,),
                      Image.asset(
                        'assets/Images/chips.png',
                        width: 10,
                      ),
                    ],
                  ),


                    //Rank 4

                    SizedBox(width: 20,height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rank 4'),
                        SizedBox(width: 230),
                        Text('1000',textAlign: TextAlign.right,),
                        Image.asset(
                          'assets/Images/chips.png',
                          width: 10,
                        ),
                      ],
                    ),

                    //Rank 5

                    SizedBox(width: 20,height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rank 5'),
                        SizedBox(width: 230),
                        Text('1000',textAlign: TextAlign.right,),
                        Image.asset(
                          'assets/Images/chips.png',
                          width: 10,
                        ),
                      ],
                    ),

                    //Rank 6

                    SizedBox(width: 20,height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rank 6'),
                        SizedBox(width: 230),
                        Text('1000',textAlign: TextAlign.right,),
                        Image.asset(
                          'assets/Images/chips.png',
                          width: 10,
                        ),
                      ],
                    ),


                    //Rank 7

                    SizedBox(width: 20,height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rank 7'),
                        SizedBox(width: 230),
                        Text('1000',textAlign: TextAlign.right,),
                        Image.asset(
                          'assets/Images/chips.png',
                          width: 10,
                        ),
                      ],
                    ),


                    //Rank 8

                    SizedBox(width: 20,height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rank 8'),
                        SizedBox(width: 230),
                        Text('1000',textAlign: TextAlign.right,),
                        Image.asset(
                          'assets/Images/chips.png',
                          width: 10,
                        ),
                      ],
                    ),

                    //Rank 9

                    SizedBox(width: 20,height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rank 9'),
                        SizedBox(width: 230),
                        Text('1000',textAlign: TextAlign.right,),
                        Image.asset(
                          'assets/Images/chips.png',
                          width: 10,
                        ),
                      ],
                    ),

                    //Rank 10

                    SizedBox(width: 20,height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rank 10'),
                        SizedBox(width: 230),
                        Text('1000',textAlign: TextAlign.right,),
                        Image.asset(
                          'assets/Images/chips.png',
                          width: 10,
                        ),
                      ],
                    ),


                ],)


              ],
            ),
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 200,
        height: 30,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
          onPressed: (){},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Text('Pay '+Tournament['Registration Fee'].toString()+' and Register' ,style: TextStyle(fontFamily: 'Orbitron' , color: Colors.white),)
        ),
      ),);
  }
}
