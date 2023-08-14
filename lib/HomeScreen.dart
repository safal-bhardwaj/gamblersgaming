import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/NewTournament.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Backend
  // var Card = {
  //   "Date": null,
  //   "Time": "",
  //   "Game_Image": "",
  //   "Title": "",
  //   "Game": "",
  //   "Registration Fee": 0,
  //   "Prize Pool": 0,
  //   "Prize Pool Distribution": "",
  //   "Participants": [],
  // };

  List<Map> Card_List = [];
  bool _isLoading = true;

  void cardData() async {
    await FirebaseFirestore.instance
        .collection('Hosted Tournaments')
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        var Card = {};
        Card['Game_Image'] = doc["Game_Image"];
        Card['Date'] = doc["Date"];
        Card['Time'] = doc["Time"];
        Card['Title'] = doc["Title"];
        Card['Game'] = doc["Game"];
        Card['Registration Fee'] = doc["Registration Fee"];
        Card['Prize Pool'] = doc["Prize Pool"];
        Card['Prize Pool Distribution'] = doc["Prize Pool Distribution"];
        Card['Participants'] = doc["Participants"];

        Card_List.add(Card);
      }
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    cardData();
  }

// frontend
  //variables
  final formatter = DateFormat.yMMMMd('en_US');

  @override
  Widget build(context) {
    final List<String> imageList = [
      'assets/Images/img1.png',
      'assets/Images/img2.png',
      'assets/Images/img3.png',
      'assets/Images/img4.jpg',
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = MediaQuery.of(context).textScaleFactor;
    EdgeInsets screenPadding = MediaQuery.of(context).padding;

    void _openAddTournamentOverlay() {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
          ),
        ),
        builder: (ctx) {
          return const NewTournament();
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 10),
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.05,
        title: Text(''),
      ),
      body: Center(
          child: _isLoading
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Color.fromRGBO(255, 15, 24, 1),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(13),
                        child: CarouselSlider.builder(
                          itemCount: imageList.length,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            viewportFraction: 0.46,
                            height: screenHeight * 0.33,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            reverse: false,
                          ),
                          itemBuilder: (context, i, id) {
                            //for onTap to redirect to another screen
                            return GestureDetector(
                              child: Container(
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  //border: Border.all(color: Colors.white,)
                                ),
                                //ClipRRect for image border radius
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    imageList[i],
                                    width: screenWidth * 0.4,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.022,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: screenPadding.left + 10),
                          child: SizedBox(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.04,
                            child: RichText(
                              text: const TextSpan(
                                  text: 'Recent',
                                  style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    color: Color.fromRGBO(255, 15, 24, 10),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Tournaments:',
                                        style: TextStyle(
                                            fontFamily: 'Orbitron',
                                            color: Colors.white))
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.33,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Card_List.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(
                                    screenPadding.left + 10,
                                    0,
                                    screenPadding.right + 16,
                                    0),
                                child: Container(
                                    width: screenWidth * 0.68,
                                    height: screenHeight * 0.34,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(20, 20, 20, 1),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            child: Image.asset(
                                                Card_List[index]
                                                    ["Game_Image"],
                                                width: screenWidth * 0.68,
                                                height: screenHeight * 0.156,
                                                fit: BoxFit.cover)),
                                        SizedBox(height:  screenHeight * 0.006,),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              screenPadding.left + 8,
                                              0,
                                              screenPadding.right + 8,
                                              screenPadding.bottom + 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: Color.fromRGBO(
                                                          128, 8, 12, 1))),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  Card_List[index]["Title"],
                                                  style: TextStyle(
                                                      fontFamily: "orbitron",
                                                      fontSize: fontSize * 10),
                                                  textAlign: TextAlign.start,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons.people,
                                                      color: Color.fromRGBO(
                                                          128, 8, 12, 1),
                                                    ),
                                                    SizedBox(
                                                      width: screenWidth *
                                                          0.013,
                                                    ),
                                                    Text(
                                                      "${Card_List[index]["Participants"].length}/${Card_List[index]["Game"] == "Asphalt" ? 8 : 100}",
                                                      style: TextStyle(
                                                          fontSize:
                                                              fontSize * 11,
                                                          fontFamily:
                                                              "MSPGothic"),
                                                    ),
                                                    //SizedBox(width: 3,),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              screenPadding.left +  8,
                                              0,
                                              screenPadding.right +  8,
                                              0),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "Date",
                                                    style: TextStyle(
                                                        fontSize: fontSize * 13,
                                                        fontFamily:
                                                            "MSPGothic",
                                                        color: Color.fromRGBO(
                                                            128, 8, 12, 1)),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        screenHeight * 0.001,
                                                  ),
                                                  Text(
                                                    "${formatter.format(DateTime.fromMillisecondsSinceEpoch(Card_List[index]["Date"].seconds * 1000))}",
                                                    style: TextStyle(
                                                        fontSize: fontSize * 9,
                                                        fontFamily:
                                                            "orbitron"),
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.topRight,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Time",
                                                        style: TextStyle(
                                                            fontSize: fontSize * 13,
                                                            fontFamily:
                                                                "MSPGothic",
                                                            color: Color
                                                                .fromRGBO(
                                                                    128,
                                                                    8,
                                                                    12,
                                                                    1)),
                                                      ),
                                                      SizedBox(
                                                        height: screenHeight *
                                                            0.001,
                                                      ),
                                                      Text(
                                                        Card_List[index]
                                                            ["Time"],
                                                        style: TextStyle(
                                                            fontSize: fontSize * 9,
                                                            fontFamily:
                                                                "orbitron"),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0,
                                              screenPadding.top - 24,
                                              screenPadding.right +  8,
                                              0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    screenPadding.left + 17,
                                                    0,
                                                    0,
                                                    0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Entry Fee",
                                                      style: TextStyle(
                                                          fontSize: fontSize * 13,
                                                          fontFamily:
                                                              "MSPGothic",
                                                          color:
                                                              Color.fromRGBO(
                                                                  128,
                                                                  8,
                                                                  12,
                                                                  1)),
                                                    ),
                                                    SizedBox(
                                                      height: screenHeight *
                                                          0.001,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/Images/chips.png',
                                                          width: screenWidth *
                                                              0.03,
                                                        ),
                                                        SizedBox(
                                                          width: screenWidth *
                                                              0.01,
                                                        ),
                                                        Text(
                                                          "${Card_List[index]["Registration Fee"]}",
                                                          style: TextStyle(
                                                              fontSize: fontSize * 9,
                                                              fontFamily:
                                                                  "orbitron"),
                                                          textAlign: TextAlign
                                                              .center,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.topRight,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .end,
                                                    children: [
                                                      Text(
                                                        "Prize Pool",
                                                        style: TextStyle(
                                                            fontSize:
                                                                fontSize * 13,
                                                            fontFamily:
                                                                "MSPGothic",
                                                            color: Color
                                                                .fromRGBO(
                                                                    128,
                                                                    8,
                                                                    12,
                                                                    1)),
                                                      ),
                                                      SizedBox(
                                                        height: screenHeight *
                                                            0.001,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          print(
                                                              "safal kutta");
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Image.asset(
                                                              'assets/Images/chips.png',
                                                              width:
                                                                  screenWidth *
                                                                      0.03,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  screenWidth *
                                                                      0.01,
                                                            ),
                                                            Text(
                                                              "${Card_List[index]["Prize Pool"]}",
                                                              style: TextStyle(
                                                                  fontSize: fontSize * 9,
                                                                  fontFamily:
                                                                      "orbitron"),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  screenWidth *
                                                                      0.01,
                                                            ),
                                                            Image.asset(
                                                              'assets/Images/downarrow.png',
                                                              width:
                                                                  screenWidth *
                                                                      0.04,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.002,),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              screenPadding.left + 8, 0, screenPadding.right + 8, 0),
                                          child: Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "More Details ",
                                                    style: TextStyle(
                                                        color: Color
                                                            .fromRGBO(
                                                                255,
                                                                15,
                                                                24,
                                                                1),
                                                      fontSize: fontSize * 10
                                                    ),
                                                  )),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.topRight,
                                                  child: SizedBox(
                                                    height: screenHeight * 0.025,
                                                    child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color
                                                                    .fromRGBO(
                                                                255,
                                                                15,
                                                                24,
                                                                10),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13)),
                                                      ),
                                                      child: Text(
                                                        'Join The Game',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Orbitron',
                                                          fontSize: fontSize * 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            }),
                      ),
                      SizedBox(height: 80,)
                    ],
                  ),
                )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        width: screenWidth * 0.15,
        height: screenHeight * 0.1,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
          onPressed: _openAddTournamentOverlay,
          child: Image.asset(
            'assets/Images/Gamer/game-controller (3).png',
            width: screenWidth * 0.1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
