import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tournament_Screen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Tournament_Screen({Key? key, required this.Tournament}) : super(key: key);
  // ignore: non_constant_identifier_names
  Map<String, dynamic> Tournament;

  @override
  State<Tournament_Screen> createState() => _Tournament_ScreenState();
}

class _Tournament_ScreenState extends State<Tournament_Screen> {
  final formatter = DateFormat.yMMMMd('en_US');

  List<int> prizepooldist = [];

  @override
  void initState() {
    super.initState(); // Call the super.initState() first.

    // Assuming Tournament['Prizes'] is a Map<int, int>.
    widget.Tournament['Prizes'].forEach((key, value) {
      if (value != 0) {
        prizepooldist.add(value); // Add the value to the prizepooldist list.
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(20, 20, 20, 1,),
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(128, 8, 12, 1), //change your color here
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body:

            // Whole search container


            Column(
              children: [


                // Image

                ClipRRect(
                  borderRadius: const BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13)),
                  child: Image.asset(
                    widget.Tournament['Game_Image'],
                    fit: BoxFit.cover,
                    width: screenWidth ,
                  ),
                ),


                // Title + Participants count

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
                          widget.Tournament['Title'],
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
                                "${widget.Tournament["Participants"].length}/${widget.Tournament["Game"] == "Asphalt" ? 8 : 100}",
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
                          Text("${formatter.format(DateTime.fromMillisecondsSinceEpoch(widget.Tournament["Date"].seconds * 1000))}",
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
                            widget.Tournament["Time"],
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
                            widget.Tournament["Registration Fee"].toString(),
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
                            Text(widget.Tournament['Maps'],
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
                              widget.Tournament['Perspective'].toString(),
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
                              widget.Tournament['Players'],
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

                SizedBox(height: screenHeight * 0.02,),


                Container(
                  height: 50,
                  child: ListView.builder(
                    itemCount: prizepooldist.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Rank ${index + 1}'),
                          SizedBox(width: 230),
                          Text('${prizepooldist[index]}'),
                          Image.asset(
                            'assets/Images/chips.png',
                            width: 10,
                          ),
                        ],
                      );
                    },
                  ),
                ),


              ],
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
          child: Text('Pay '+widget.Tournament['Registration Fee'].toString()+' and Register' ,style: TextStyle(fontFamily: 'Orbitron' , color: Colors.white),)
        ),
      ),);
  }
}
