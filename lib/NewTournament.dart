import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class NewTournament extends StatefulWidget {
  const NewTournament({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewTournamentState();
  }
}

class _NewTournamentState extends State<NewTournament> {
  //Backend
  //variables

  DateTime _date = DateTime.now();
  String _time = "";
  String _Title = "";
  String _Game = "";
  int _RegFee = 0;
  int _PrizePool = 0;
  String _PrizePoolDist = "";

  List<List<String>> _Participants = [];

  String TournamentID = "";

  void _hostTournament() async {
    _date = selectedDate!;
    _time = timeOfDay!.format(context) ;

    _Title = _titlecontroller.text;
    _Game = dropdownvalue;
    _RegFee = int.parse(regPrice.text);
    _PrizePool = int.parse(prizePool.text);
    _PrizePoolDist = prizeDist;
    print(_PrizePoolDist);
    await FirebaseFirestore.instance.collection('Hosted Tournaments').add({
      "Date" : _date,
      "Time" : _time.toString(),
      "Game_Image" : img[_showimg],
      "Title" : _Title,
      "Game" : _Game,
      "Registration Fee" : _RegFee,
      "Prize Pool" : _PrizePool,
      "Prize Pool Distribution" : _PrizePoolDist,
      "Participants" : _Participants,
    }).then((documentSnapshot) => TournamentID=documentSnapshot.id );;
    print(TournamentID);
  }

// FrontEnd
  //var
  DateTime? selectedDate;
  TimeOfDay? timeOfDay;
  String dropdownvalue = 'BGMI';
  String prizeDist = "";
  var items = [
    'BGMI',
    'FreeFire',
    'Asphalt',
    'New State',
    'Call of Duty Mobile'
  ];

  static final List<String> img = [
    'assets/Images/bgmi.jpg',
    'assets/Images/freefire.png',
    'assets/Images/asphalt.jpg',
    'assets/Images/newstate.jpg',
    'assets/Images/callofduty.jpg'
  ];
  final _titlecontroller = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  TextEditingController prizePool = TextEditingController();
  TextEditingController regPrice = TextEditingController();

  @override
  void initState() {
    timeInput.text = ""; //set the initial value of text field
    super.initState();
    focusNode1.addListener(() {
      setState(() {
        borderColor = focusNode1.hasFocus
            ? const Color.fromRGBO(255, 15, 24, 10)
            : const Color.fromRGBO(128, 8, 12, 10);
      });
    });
    focusNode2.addListener(() {
      setState(() {
        borderColor = focusNode2.hasFocus
            ? const Color.fromRGBO(255, 15, 24, 10)
            : const Color.fromRGBO(128, 8, 12, 10);
      });
    });
  }

  final formatter = DateFormat.yMMMMd('en_US');

  void _presentdatepicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1, DateTime.now().month),
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void _timePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        timeOfDay = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titlecontroller.dispose();
  }

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  Color borderColor = const Color.fromRGBO(128, 8, 12, 10);
  bool _showButton = false;
  bool _showrestbuttons = true;
  int _showimg = 0;

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                //Date-picker
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.01,
                        0,
                        0,
                        screenHeight * 0.01,
                      ),
                      child: TextButton(
                        onPressed: _presentdatepicker,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: Row(children: [
                          const Icon(Icons.calendar_month),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: Text(
                              selectedDate == null
                                  ? 'Date'
                                  : formatter.format(selectedDate!),
                              style: const TextStyle(
                                  fontFamily: 'MSPGothic', fontSize: 16),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                )),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.03,
                          0,
                          screenWidth * 0.01,
                          screenHeight * 0.01,
                        ),
                        child: TextButton(
                            onPressed: _timePicker,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.3,
                                  child: Text(
                                    timeOfDay == null
                                        ? 'Time'
                                        : timeOfDay!.format(context).toString(),
                                    style: const TextStyle(
                                        fontFamily: 'MSPGothic', fontSize: 16),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.02,
                                ),
                                const Icon(Icons.watch_later_outlined),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.01,
                  screenHeight * 0.03, screenWidth * 0.01, screenHeight * 0.03),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.05,
                    child: DropdownButtonFormField<String>(
                      //menuMaxHeight: 200,
                      itemHeight: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.5),
                        ),
                        border: InputBorder.none,
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(
                            screenWidth * 0.032,
                            screenHeight * 0.01,
                            screenWidth * 0.031,
                            screenHeight * 0.01),
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      value: dropdownvalue,
                      // isExpanded: true,
                      // elevation: 20,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          _showButton = dropdownvalue == items[2];
                          if (dropdownvalue != items[2]) {
                            _showrestbuttons = true;
                          } else {
                            _showrestbuttons = false;
                          }
                          if (dropdownvalue == items[0]) {
                            _showimg = 0;
                          }
                          if (dropdownvalue == items[1]) {
                            _showimg = 1;
                          }
                          if (dropdownvalue == items[2]) {
                            _showimg = 2;
                          }
                          if (dropdownvalue == items[3]) {
                            _showimg = 3;
                          }
                          if (dropdownvalue == items[4]) {
                            _showimg = 4;
                          }
                        });
                      },
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Orbitron',
                                color: Color.fromRGBO(128, 8, 12, 10)),
                          ),
                        );
                      }).toList(),
                      icon: Image.asset(
                        'assets/Images/downarrow.png',
                        width: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  SizedBox(
                    width: screenWidth * 0.6,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _titlecontroller,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Center(
                          child: Text(
                            'Tournament Name',
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0.0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 1.2,
                          color: Color.fromRGBO(128, 8, 12, 1),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.1,
                            screenHeight * 0.01,
                            screenWidth * 0.01,
                            screenHeight * 0.01),
                        child: const Text(
                          'Registration Fee        :',
                          style: TextStyle(
                              fontFamily: 'MSPGothic',
                              fontSize: 16,
                              color: Color.fromRGBO(255, 15, 24, 10)),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.001,
                            screenHeight * 0.01,
                            screenWidth * 0.01,
                            screenHeight * 0.01),
                        child: Container(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.037,
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor, width: 2),
                              borderRadius: BorderRadius.circular(20.5),
                              color: Colors.white),
                          child: SizedBox(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.037,
                            child: TextField(
                              focusNode: focusNode1,
                              controller: regPrice,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  color: Color.fromRGBO(128, 8, 12, 10)),
                              decoration: InputDecoration(
                                label: Text(''),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.fromLTRB(
                                    screenWidth * 0.03,
                                    0,
                                    0,
                                    screenHeight * 0.013),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.01,
                      ),
                      Image.asset(
                        'assets/Images/chips.png',
                        width: screenWidth * 0.055,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.1,
                            screenHeight * 0.01,
                            screenWidth * 0.01,
                            screenHeight * 0.01),
                        child: const Text(
                          'Prize Pool                :',
                          style: TextStyle(
                              fontFamily: 'MSPGothic',
                              fontSize: 16,
                              color: Color.fromRGBO(255, 15, 24, 10)),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.001,
                            screenHeight * 0.01,
                            screenWidth * 0.01,
                            screenHeight * 0.01),
                        child: Container(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.037,
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor, width: 2),
                              borderRadius: BorderRadius.circular(20.5),
                              color: Colors.white),
                          child: SizedBox(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.037,
                            child: TextField(
                              focusNode: focusNode2,
                              controller: prizePool,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: Text(''),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.fromLTRB(
                                    screenWidth * 0.03,
                                    0,
                                    0,
                                    screenHeight * 0.013),
                              ),
                              style: const TextStyle(
                                  color: Color.fromRGBO(128, 8, 12, 10)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.01,
                      ),
                      Image.asset(
                        'assets/Images/chips.png',
                        width: screenWidth * 0.055,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: const TextSpan(
                          text: 'Prize',
                          style: TextStyle(
                              fontFamily: 'Orbitron',
                              color: Color.fromRGBO(255, 15, 24, 10),
                              fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Distribution',
                                style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    color: Colors.white,
                                    fontSize: 16))
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Visibility(
                    visible: _showButton,
                    child: SizedBox(
                      width: screenWidth * 0.23,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.5)),
                            backgroundColor: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Images/crown.png',
                              width: 15,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text('Top 2',
                                style: TextStyle(
                                    fontFamily: 'MSPGothic',
                                    fontSize: 16,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _showrestbuttons,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                prizeDist = "Top 1";
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.5)),
                                  backgroundColor: Colors.white),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/Images/crown.png',
                                    width: 15,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text('Top 1',
                                      style: TextStyle(
                                          fontFamily: 'MSPGothic',
                                          fontSize: 16,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.023,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                prizeDist = "Top 3";
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.5)),
                                  backgroundColor: Colors.white),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/Images/crown.png',
                                    width: 15,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text('Top 3',
                                      style: TextStyle(
                                          fontFamily: 'MSPGothic',
                                          fontSize: 16,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.023,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                prizeDist = "Top 5";
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.5)),
                                  backgroundColor: Colors.white),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/Images/crown.png',
                                    width: 15,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text('Top 5',
                                      style: TextStyle(
                                          fontFamily: 'MSPGothic',
                                          fontSize: 16,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.023,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                prizeDist = "Top 10";
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.5)),
                                  backgroundColor: Colors.white),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/Images/crown.png',
                                    width: 15,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text('Top 10',
                                      style: TextStyle(
                                          fontFamily: 'MSPGothic',
                                          fontSize: 16,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.008,
                        ),
                        const Text(
                          'or',
                          style: TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: 17,
                              color: Color.fromRGBO(255, 15, 24, 10)),
                        ),
                        SizedBox(
                          height: screenHeight * 0.008,
                        ),
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: ElevatedButton(
                            onPressed: () {
                              prizeDist = "Pay Per Kill";
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.5)),
                                backgroundColor: Colors.white,
                                alignment: Alignment.center),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/Images/crown.png',
                                  width: 15,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text('Pay per kill',
                                    style: TextStyle(
                                        fontFamily: 'MSPGothic',
                                        fontSize: 16,
                                        color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: ElevatedButton(
                      onPressed: _hostTournament,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                      ),
                      child: Text(
                        'Host Tournament',
                        style: TextStyle(
                          fontFamily: 'Orbitron',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        'assets/Images/close.png',
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: true,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          transform: Matrix4.translationValues(0.0, -75, 0.0),
          // translate up by 30
          child: CircleAvatar(
            backgroundImage: AssetImage(img[_showimg]),
            radius: 65,
          ),
        ),
      ),
      // dock it to the center top (from which it is translated)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}
