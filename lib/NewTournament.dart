import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewTournament extends StatefulWidget {
  const NewTournament({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewTournamentState();
  }
}

class IconWithText {
  final Icon icon;
  final String text;
  IconWithText({required this.icon, required this.text});
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
    _time = timeOfDay!.format(context);

    _Title = _titlecontroller.text;
    _Game = dropdownvalue;
    _RegFee = int.parse(_regPrice.text);
    _PrizePool = int.parse(_prizePool.text);
    _PrizePoolDist = prizeDist;
    print(_PrizePoolDist);
    await FirebaseFirestore.instance.collection('Hosted Tournaments').add({
      "Date": _date,
      "Time": _time.toString(),
      "Game_Image": img[_showimg],
      "Title": _Title,
      "Game": _Game,
      "Registration Fee": _RegFee,
      "Prize Pool": _PrizePool,
      "Prize Pool Distribution": _PrizePoolDist,
      "Participants": _Participants,
    }).then((documentSnapshot) => TournamentID = documentSnapshot.id);
    ;
    print(TournamentID);
  }

// front end variables

//   Map<String, bool> _individualPrizePoolButtons = {
//   '_top1' : true,
//   '_top2' : true,
//   '_top3' : true,
//   '_top5' : true,
//   '_top10' : true,
//   '_payperkill' : true,
//   '_ortext' : true,
//
//   '_prizepooldist' : false,
//   };

  bool _click = false;
  bool _showButton = false;
  bool _showrestbuttons = true;
  int _showimg = 0;
  String prizeDist = "";
  late String? _selectedModesText;
  late String _selectedPlayersText;

  List<bool> _individualPrizePoolButtons = [
    true, true, true, true, true, true, true, false
  ];

  List<String> games = [
    'BGMI',
    'FreeFire',
    'Asphalt',
    'New State',
    'Call of Duty Mobile'
  ];

  Map<String, List<String>> maps = {
    //'Choose your Map' :['Choose your Map'],
    'BGMI': ['Erangle', 'Miramar', 'Livik', 'Sanhok', 'Vikendi', 'Karakin'],
    'FreeFire': ['Bermuda', 'Purgatory', 'Kalahari', 'Alpine'],
    'Asphalt': ['Random'],
    'New State': ['Erangle', 'Troi'],
    'Call of Duty Mobile': ['Classic'],
  };

  late String defaultmapval;
  String dropdownvalue = 'BGMI';

  static const List<Widget> modes = <Widget>[
    Text(
      'TPP',
      style: TextStyle(fontSize: 12, fontFamily: 'Orbitron'),
    ),
    Text(
      'FPP',
      style: TextStyle(fontSize: 12, fontFamily: 'Orbitron'),
    )
  ];

  final List<bool> _selectedmodes = <bool>[true, false];
  static  List<IconWithText> players = <IconWithText>[
    IconWithText(icon : Icon(Icons.person), text: 'single'),
    IconWithText(icon: Icon(Icons.group), text: 'duo'),
    IconWithText(icon: Icon(Icons.group_add), text: 'squad')
  ];
  final List<bool> _selectedplayers = <bool>[true, false, false];

  final List<String> img = [
    'assets/Images/bgmi.jpg',
    'assets/Images/freefire.png',
    'assets/Images/asphalt.jpg',
    'assets/Images/newstate.jpg',
    'assets/Images/callofduty.jpg'
  ];
  final _titlecontroller = TextEditingController();
  TextEditingController _timeInput = TextEditingController();
  TextEditingController _prizePool = TextEditingController();
  TextEditingController _regPrice = TextEditingController();
  TextEditingController _top1Prize = TextEditingController();
  TextEditingController _top2Prize = TextEditingController();
  TextEditingController _top3Prize = TextEditingController();
  TextEditingController _top4Prize = TextEditingController();
  TextEditingController _top5Prize = TextEditingController();
  TextEditingController _top6Prize = TextEditingController();
  TextEditingController _top7Prize = TextEditingController();
  TextEditingController _top8Prize = TextEditingController();
  TextEditingController _top9Prize = TextEditingController();
  TextEditingController _top10Prize = TextEditingController();
  TextEditingController _payPerKillPrize = TextEditingController();

  @override
  void initState() {
    _timeInput.text = ""; //set the initial value of text field
    super.initState();
  }

  final formatter = DateFormat.yMMMMd('en_US');
  DateTime? selectedDate;
  _presentdatepicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1, DateTime.now().month),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.black, // <-- SEE HERE
              onPrimary: Color.fromRGBO(255, 15, 24, 1),  // <-- SEE HERE
              onSurface: Color.fromRGBO(255, 15, 24, 1), // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color.fromRGBO(255, 15, 24, 1), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  TimeOfDay? timeOfDay;
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

  @override
  Widget build(context) {
    List<String> mapitems = maps[dropdownvalue] ?? [];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
        body: SingleChildScrollView(
          child: Column(children: [
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
                      onPressed: () => _presentdatepicker(context),
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

              //Time-picker
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
            padding: EdgeInsets.fromLTRB(screenWidth * 0.01, screenHeight * 0.03,
                screenWidth * 0.01, screenHeight * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Drop-down of games
                SizedBox(
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
                        _showButton = dropdownvalue == games[2];
                        if (dropdownvalue != games[2]) {
                          _showrestbuttons = true;
                        } else {
                          _showrestbuttons = false;
                        }
                        if (dropdownvalue == games[0]) {
                          _showimg = 0;
                        }
                        if (dropdownvalue == games[1]) {
                          _showimg = 1;
                        }
                        if (dropdownvalue == games[2]) {
                          _showimg = 2;
                        }
                        if (dropdownvalue == games[3]) {
                          _showimg = 3;
                        }
                        if (dropdownvalue == games[4]) {
                          _showimg = 4;
                        }
                      });
                    },
                    items: games.map((String games) {
                      return DropdownMenuItem(
                        value: games,
                        child: Text(
                          games,
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



                //Game Title
                SizedBox(
                  width: screenWidth * 0.46,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _titlecontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Center(
                        child: Text(
                          'Tournament Name',
                          style: TextStyle(
                            fontFamily: 'Orbitron',
                            fontSize: screenWidth * 0.03,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(0.0),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        width: 1.2,
                        color: Color.fromRGBO(128, 8, 12, 1),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),



                //RegistrationFee
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.08,
                          screenHeight * 0.01,
                          screenWidth * 0.014,
                          screenHeight * 0.01),
                      child: Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.02),
                        child: Text(
                          'Registration Fee',
                          style: TextStyle(
                              fontFamily: 'MSPGothic',
                              fontSize: screenWidth * 0.036,
                              color: const Color.fromRGBO(255, 15, 24, 10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.1,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                          fontFamily: 'MSPGothic',
                          fontSize: screenWidth * 0.036,
                          color: const Color.fromRGBO(255, 15, 24, 10)),
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
                            borderRadius: BorderRadius.circular(20.5),
                            color: Colors.white),
                        child: SizedBox(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.037,
                          child: TextField(
                            controller: _prizePool,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                color: Color.fromRGBO(128, 8, 12, 10)),
                            decoration: InputDecoration(
                              label: const Text(''),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(
                                  screenWidth * 0.03, 0, 0, screenHeight * 0.013),
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



                //PrizePool
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.17,
                          screenHeight * 0.01,
                          screenWidth * 0.014,
                          screenHeight * 0.01),
                      child: Text(
                        'Prize Pool',
                        style: TextStyle(
                            fontFamily: 'MSPGothic',
                            fontSize: screenWidth * 0.036,
                            color: const Color.fromRGBO(255, 15, 24, 10)),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.12,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                          fontFamily: 'MSPGothic',
                          fontSize: screenWidth * 0.036,
                          color: const Color.fromRGBO(255, 15, 24, 10)),
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
                            borderRadius: BorderRadius.circular(20.5),
                            color: Colors.white),
                        child: SizedBox(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.037,
                          child: TextField(
                            controller: _regPrice,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              label: const Text(''),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(
                                  screenWidth * 0.03, 0, 0, screenHeight * 0.013),
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
                  height: screenHeight * 0.03,
                ),



                //Prize Distribution text
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: 'Prize',
                        style: TextStyle(
                            fontFamily: 'Orbitron',
                            color: const Color.fromRGBO(255, 15, 24, 10),
                            fontSize: screenWidth * 0.034),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Distribution',
                              style: TextStyle(
                                  fontFamily: 'Orbitron',
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.034))
                        ]),
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.015,
                ),



                //Prize Dist Buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: _showButton,
                      child: SizedBox(
                        width: screenWidth * 0.22,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              prizeDist = "Top 2";
                              _click = !_click;
                              if (_click) {
                                _individualPrizePoolButtons[1] = true;
                                _individualPrizePoolButtons[7] = true;
                              }
                              else {
                                _individualPrizePoolButtons[7] = false;
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.5)),
                              backgroundColor: _click
                                  ? const Color.fromRGBO(128, 8, 12, 1)
                                  : Colors.white,
                              alignment: Alignment.center),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/Images/crown.png',
                                  width: screenWidth * 0.03,
                                  color: _click ? Colors.white : Colors.black),
                              SizedBox(
                                width: screenWidth * 0.005,
                              ),
                              Text('Top 2',
                                  style: TextStyle(
                                      fontFamily: 'MSPGothic',
                                      fontSize: screenWidth * 0.034,
                                      color:
                                          _click ? Colors.white : Colors.black))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: _showrestbuttons,
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //top1
                              Visibility(
                                visible: _individualPrizePoolButtons[0],
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      prizeDist = "Top 1";
                                      _click = !_click;
                                      if (_click) {
                                        // for (int i = 1; i <_individualPrizePoolButtons.length - 1; i++) {
                                        //   _individualPrizePoolButtons[i] = false;
                                        // }
                                        _individualPrizePoolButtons[1] = false;
                                        _individualPrizePoolButtons[2] = false;
                                        _individualPrizePoolButtons[3] = false;
                                        _individualPrizePoolButtons[4] = false;
                                        _individualPrizePoolButtons[5] = false;
                                        _individualPrizePoolButtons[6] = false;
                                      } else {
                                        // for (int i = 2; i < _individualPrizePoolButtons.length - 2; i++) {
                                        //   _individualPrizePoolButtons[i] = true;

                                        //}
                                        _individualPrizePoolButtons[2] = true;
                                        _individualPrizePoolButtons[3] = true;
                                        _individualPrizePoolButtons[4] = true;
                                        _individualPrizePoolButtons[5] = true;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.5)),
                                      backgroundColor: _click
                                          ? const Color.fromRGBO(128, 8, 12, 1)
                                          : Colors.white,
                                      alignment: Alignment.center),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/Images/crown.png',
                                          width: screenWidth * 0.03,
                                          color: _click
                                              ? Colors.white
                                              : Colors.black),
                                      SizedBox(
                                        width: screenWidth * 0.005,
                                      ),
                                      Text('Top 1',
                                          style: TextStyle(
                                              fontFamily: 'MSPGothic',
                                              fontSize: screenWidth * 0.034,
                                              color: _click
                                                  ? Colors.white
                                                  : Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: _individualPrizePoolButtons[0],
                                  child: SizedBox(
                                    width: screenWidth * 0.022,
                                  )),
                              //top 3
                              Visibility(
                                visible: _individualPrizePoolButtons[2],
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      prizeDist = "Top 3";
                                      _click = !_click;
                                      if (_click) {
                                        // _individualPrizePoolButtons[7] = true;
                                        // for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                        //   if (i != 2 || i!=7) {
                                        //     _individualPrizePoolButtons[i] = false;
                                        //   }
                                        // }
                                        _individualPrizePoolButtons[0] =  false;
                                        _individualPrizePoolButtons[1] = false;
                                        _individualPrizePoolButtons[3] = false;
                                        _individualPrizePoolButtons[4] = false;
                                        _individualPrizePoolButtons[5] = false;
                                        _individualPrizePoolButtons[6] = false;
                                        _individualPrizePoolButtons[7] = true;
                                      }
                                      else {
                                        // _individualPrizePoolButtons[7] = false;
                                        // for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                        //   if (i != 2 || i != 7) {
                                        //     _individualPrizePoolButtons[i] = true;
                                        //   }
                                        // }
                                        _individualPrizePoolButtons[0] =  true;
                                        _individualPrizePoolButtons[3] = true;
                                        _individualPrizePoolButtons[4] = true;
                                        _individualPrizePoolButtons[5] = true;
                                        _individualPrizePoolButtons[6] = true;
                                        _individualPrizePoolButtons[7] = false;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.5)),
                                      backgroundColor: _click
                                          ? const Color.fromRGBO(128, 8, 12, 1)
                                          : Colors.white,
                                      alignment: Alignment.center),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/Images/crown.png',
                                          width: screenWidth * 0.03,
                                          color: _click
                                              ? Colors.white
                                              : Colors.black),
                                      SizedBox(
                                        width: screenWidth * 0.005,
                                      ),
                                      Text('Top 3',
                                          style: TextStyle(
                                              fontFamily: 'MSPGothic',
                                              fontSize: screenWidth * 0.034,
                                              color: _click
                                                  ? Colors.white
                                                  : Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: _individualPrizePoolButtons[2],
                                  child: SizedBox(
                                    width: screenWidth * 0.022,
                                  )),

                              //top 5
                              Visibility(
                                visible: _individualPrizePoolButtons[3],
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      prizeDist = "Top 5";
                                      _click = !_click;
                                      if (_click == true) {
                                        // _individualPrizePoolButtons[7] = true;
                                        // for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                        //   if (i != 3) {
                                        //     _individualPrizePoolButtons[i] = false;
                                        //   }
                                        // }
                                        _individualPrizePoolButtons[0] = false;
                                        _individualPrizePoolButtons[1]= false;
                                        _individualPrizePoolButtons[2] = false;
                                        _individualPrizePoolButtons[4] = false;
                                        _individualPrizePoolButtons[5] = false;
                                        _individualPrizePoolButtons[6] = false;
                                        _individualPrizePoolButtons[7] = true;
                                      } else if(_click == false) {
                                        // _individualPrizePoolButtons[7] =
                                        // false;
                                        // for (int i = 0;
                                        //     i < _individualPrizePoolButtons.length;
                                        //     i++) {
                                        //   if (i != 3 || i != 7) {
                                        //     _individualPrizePoolButtons[i] = true;
                                        //   }
                                        // }
                                        _individualPrizePoolButtons[0] = true;
                                        _individualPrizePoolButtons[2] = true;
                                        _individualPrizePoolButtons[4] = true;
                                        _individualPrizePoolButtons[5] = true;
                                        _individualPrizePoolButtons[6] = true;
                                        _individualPrizePoolButtons[7] = false;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.5)),
                                      backgroundColor: _click
                                          ? const Color.fromRGBO(128, 8, 12, 1)
                                          : Colors.white,
                                      alignment: Alignment.center),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Images/crown.png',
                                        width: screenWidth * 0.03,
                                        color:
                                            _click ? Colors.white : Colors.black,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.005,
                                      ),
                                      Text('Top 5',
                                          style: TextStyle(
                                              fontFamily: 'MSPGothic',
                                              fontSize: screenWidth * 0.034,
                                              color: _click
                                                  ? Colors.white
                                                  : Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: _individualPrizePoolButtons[3],
                                  child: SizedBox(
                                    width: screenWidth * 0.022,
                                  )),
                              //top 10
                              Visibility(
                                visible: _individualPrizePoolButtons[4],
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      prizeDist = "Top 10";
                                      _click = !_click;
                                      if (_click == true) {
                                        // for (int i = 0;i <_individualPrizePoolButtons.lengthi;i++) {
                                        //   if (i != 4) {
                                        //     _individualPrizePoolButtons[i] =
                                        //         !_individualPrizePoolButtons[i];
                                        //   }
                                        // }

                                        _individualPrizePoolButtons[0] = false;
                                        _individualPrizePoolButtons[1] = false;
                                        _individualPrizePoolButtons[2] = false;
                                        _individualPrizePoolButtons[3] = false;
                                        _individualPrizePoolButtons[5] = false;
                                        _individualPrizePoolButtons[6] = false;
                                        _individualPrizePoolButtons[7] = true;
                                      } else {
                                        // for (int i = 0;i <_individualPrizePoolButtons.length ; i++) {
                                        //   if (i != 4 || i != 7) {
                                        //     _individualPrizePoolButtons[i] = true;
                                        //   } else if (i == 7) {
                                        //     _individualPrizePoolButtons[7] =
                                        //         false;
                                        //   }
                                        // }
                                        _individualPrizePoolButtons[0] = true;
                                        _individualPrizePoolButtons[2] = true;
                                        _individualPrizePoolButtons[3] = true;
                                        _individualPrizePoolButtons[5] = true;
                                        _individualPrizePoolButtons[6] = true;
                                        _individualPrizePoolButtons[7] = false;
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.5)),
                                      backgroundColor: _click
                                          ? const Color.fromRGBO(128, 8, 12, 1)
                                          : Colors.white,
                                      alignment: Alignment.center),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Images/crown.png',
                                        width: screenWidth * 0.03,
                                        color:
                                            _click ? Colors.white : Colors.black,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.005,
                                      ),
                                      Text('Top 10',
                                          style: TextStyle(
                                              fontFamily: 'MSPGothic',
                                              fontSize: screenWidth * 0.034,
                                              color: _click
                                                  ? Colors.white
                                                  : Colors.black))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: screenHeight * 0.008,
                          ),

                          //or text
                          Visibility(
                              visible: _individualPrizePoolButtons[6],
                              child: Text(
                                'or',
                                style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    fontSize: screenWidth * 0.034,
                                    color: const Color.fromRGBO(255, 15, 24, 10)),
                              )),
                          SizedBox(
                            height: screenHeight * 0.008,
                          ),

                          //payperkill
                          Visibility(
                            visible: _individualPrizePoolButtons[5],
                            child: SizedBox(
                              width: screenWidth * 0.3,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    prizeDist = "Pay per kill";
                                    _click = !_click;
                                    if (_click){
                                      // _individualPrizePoolButtons[7] == true;
                                      // for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                      //   if (i != 5 && i != 7) {
                                      //     _individualPrizePoolButtons[i] = false;
                                      //   }
                                      // }

                                      _individualPrizePoolButtons[6] = false;
                                      _individualPrizePoolButtons[0] = false;
                                      _individualPrizePoolButtons[1] = false;
                                      _individualPrizePoolButtons[2] = false;
                                      _individualPrizePoolButtons[3] = false;
                                      _individualPrizePoolButtons[4] = false;
                                      _individualPrizePoolButtons[7] = true;
                                    } else if(_click == false) {

                                      // for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                      //   if (i != 5 || i != 7) {
                                      //     _individualPrizePoolButtons[i] = true;
                                      //   }
                                      //   else{
                                      //     _individualPrizePoolButtons[i] = false;
                                      //   }
                                      // }
                                      _individualPrizePoolButtons[6] = true;
                                      _individualPrizePoolButtons[1] = true;
                                      _individualPrizePoolButtons[4] = true;
                                      _individualPrizePoolButtons[2] = true;
                                      _individualPrizePoolButtons[3] = true;
                                      _individualPrizePoolButtons[7] = false;
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.5)),
                                    backgroundColor: _click
                                        ? const Color.fromRGBO(128, 8, 12, 1)
                                        : Colors.white,
                                    alignment: Alignment.center),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/Images/crown.png',
                                        width: screenWidth * 0.03,
                                        color:
                                            _click ? Colors.white : Colors.black),
                                    SizedBox(
                                      width: screenWidth * 0.005,
                                    ),
                                    Text('Pay per kill',
                                        style: TextStyle(
                                            fontFamily: 'MSPGothic',
                                            fontSize: screenWidth * 0.034,
                                            color: _click
                                                ? Colors.white
                                                : Colors.black))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ])),
                  ],
                ),


                //Prize Pool Distribution
                SizedBox(
                  height: screenHeight * 0.05,
                ),

                Visibility(
                  visible: _individualPrizePoolButtons[7],
                  child: Container(
                    width: screenWidth * 0.8,
                    height: _individualPrizePoolButtons[5] ? screenHeight * 0.08
                        : _individualPrizePoolButtons[1]
                            ? screenHeight * 0.1
                            : _individualPrizePoolButtons[2]
                                ? screenHeight * 0.16
                                : _individualPrizePoolButtons[3]
                                    ? screenHeight * 0.25
                                    : screenHeight * 0.35,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(20, 20, 20, 1),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: _individualPrizePoolButtons[0] ||
                                  _individualPrizePoolButtons[1] ||
                                  _individualPrizePoolButtons[2] ||
                                  _individualPrizePoolButtons[3] ||
                                  _individualPrizePoolButtons[4]
                              ? false
                              : true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.25,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: _payPerKillPrize,
                                  decoration: InputDecoration(
                                    label: Center(
                                      child: Text(
                                        'Prize per kill',
                                        style: TextStyle(
                                          fontFamily: 'MSPGothic',
                                          fontSize: screenWidth * 0.034,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.all(0.0),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1.2,
                                      color: Color.fromRGBO(128, 8, 12, 1),
                                    )),
                                  ),
                                ),
                                //SizedBox(width:screenWidth * 0.001 ,),
                              ),
                              Image.asset(
                                'assets/Images/chips.png',
                                width: screenWidth * 0.04,
                              )
                            ],
                          ),
                        ),
                        Row(children: [
                          Visibility(
                            visible: _individualPrizePoolButtons[0] ||
                                    _individualPrizePoolButtons[5]
                                ? false
                                : true,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.23,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    controller: _top1Prize,
                                    decoration: InputDecoration(
                                      label: Center(
                                        child: Text(
                                          'Rank 1 Prize',
                                          style: TextStyle(
                                            fontFamily: 'MSPGothic',
                                            fontSize: screenWidth * 0.034,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(0.0),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.2,
                                        color: Color.fromRGBO(128, 8, 12, 1),
                                      )),
                                    ),
                                  ),
                                  //SizedBox(width:screenWidth * 0.001 ,),
                                ),
                                Image.asset(
                                  'assets/Images/chips.png',
                                  width: screenWidth * 0.04,
                                )
                              ],
                            ),
                          ),
                          //SizedBox(width:screenWidth * 0.25 ,),

                          Visibility(
                            visible: _individualPrizePoolButtons[0] ||
                                    _individualPrizePoolButtons[5] ? false : true,
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.23,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: _top2Prize,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        label: Center(
                                          child: Text(
                                            'Rank 2 Prize',
                                            style: TextStyle(
                                              fontFamily: 'MSPGothic',
                                              fontSize: screenWidth * 0.034,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        isDense: true,
                                        contentPadding: const EdgeInsets.all(0.0),
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 1.2,
                                          color: Color.fromRGBO(128, 8, 12, 1),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/Images/chips.png',
                                    width: screenWidth * 0.04,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                        Row(
                          children: [
                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                      _individualPrizePoolButtons[1] ||
                                      _individualPrizePoolButtons[5]
                                  ? false
                                  : true,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.23,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      controller: _top3Prize,
                                      decoration: InputDecoration(
                                        label: Center(
                                          child: Text('Rank 3 Prize',
                                              style: TextStyle(
                                                fontFamily: 'MSPGothic',
                                                fontSize: screenWidth * 0.034,
                                                color: Colors.white,
                                              )),
                                        ),
                                        isDense: true,
                                        contentPadding: const EdgeInsets.all(0.0),
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 1.2,
                                          color: Color.fromRGBO(128, 8, 12, 1),
                                        )),
                                      ),
                                    ),
                                    //SizedBox(width:screenWidth * 0.001 ,),
                                  ),
                                  Image.asset(
                                    'assets/Images/chips.png',
                                    width: screenWidth * 0.04,
                                  )
                                ],
                              ),
                            ),
                            //SizedBox(width:screenWidth * 0.25 ,),
                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                      _individualPrizePoolButtons[1] ||
                                      _individualPrizePoolButtons[2] ||
                                      _individualPrizePoolButtons[5]
                                  ? false
                                  : true,
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.23,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: _top4Prize,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          label: Center(
                                            child: Text(
                                              'Rank 4 Prize',
                                              style: TextStyle(
                                                fontFamily: 'MSPGothic',
                                                fontSize: screenWidth * 0.034,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color.fromRGBO(128, 8, 12, 1),
                                          )),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/Images/chips.png',
                                      width: screenWidth * 0.04,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                      _individualPrizePoolButtons[1] ||
                                      _individualPrizePoolButtons[2] ||
                                      _individualPrizePoolButtons[5]
                                  ? false
                                  : true,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.23,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      controller: _top5Prize,
                                      decoration: InputDecoration(
                                        label: Center(
                                          child: Text(
                                            'Rank 5 Prize',
                                            style: TextStyle(
                                              fontFamily: 'MSPGothic',
                                              fontSize: screenWidth * 0.034,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        isDense: true,
                                        contentPadding: const EdgeInsets.all(0.0),
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 1.2,
                                          color: Color.fromRGBO(128, 8, 12, 1),
                                        )),
                                      ),
                                    ),
                                    //SizedBox(width:screenWidth * 0.001 ,),
                                  ),
                                  Image.asset(
                                    'assets/Images/chips.png',
                                    width: screenWidth * 0.04,
                                  )
                                ],
                              ),
                            ),
                            //SizedBox(width:screenWidth * 0.25 ,),
                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                      _individualPrizePoolButtons[1] ||
                                      _individualPrizePoolButtons[2] ||
                                      _individualPrizePoolButtons[3] ||
                                      _individualPrizePoolButtons[5]
                                  ? false
                                  : true,
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.23,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: _top6Prize,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          label: Center(
                                            child: Text(
                                              'Rank 6 Prize',
                                              style: TextStyle(
                                                fontFamily: 'MSPGothic',
                                                fontSize: screenWidth * 0.034,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color.fromRGBO(128, 8, 12, 1),
                                          )),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/Images/chips.png',
                                      width: screenWidth * 0.04,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                      _individualPrizePoolButtons[1] ||
                                      _individualPrizePoolButtons[2] ||
                                      _individualPrizePoolButtons[3] ||
                                      _individualPrizePoolButtons[5]
                                  ? false
                                  : true,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.23,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      controller: _top7Prize,
                                      decoration: InputDecoration(
                                        label: Center(
                                          child: Text(
                                            'Rank 7 Prize',
                                            style: TextStyle(
                                              fontFamily: 'MSPGothic',
                                              fontSize: screenWidth * 0.034,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        isDense: true,
                                        contentPadding: const EdgeInsets.all(0.0),
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 1.2,
                                          color: Color.fromRGBO(128, 8, 12, 1),
                                        )),
                                      ),
                                    ),
                                    //SizedBox(width:screenWidth * 0.001 ,),
                                  ),
                                  Image.asset(
                                    'assets/Images/chips.png',
                                    width: screenWidth * 0.04,
                                  )
                                ],
                              ),
                            ),
                            //SizedBox(width:screenWidth * 0.25 ,),
                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                      _individualPrizePoolButtons[1] ||
                                      _individualPrizePoolButtons[2] ||
                                      _individualPrizePoolButtons[3] ||
                                      _individualPrizePoolButtons[5]
                                  ? false
                                  : true,
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.23,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: _top8Prize,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          label: Center(
                                            child: Text(
                                              'Rank 8 Prize',
                                              style: TextStyle(
                                                fontFamily: 'MSPGothic',
                                                fontSize: screenWidth * 0.034,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color.fromRGBO(128, 8, 12, 1),
                                          )),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/Images/chips.png',
                                      width: screenWidth * 0.04,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _individualPrizePoolButtons[0] ||
                                  _individualPrizePoolButtons[1] ||
                                  _individualPrizePoolButtons[2] ||
                                  _individualPrizePoolButtons[3] ||
                                  _individualPrizePoolButtons[5]
                              ? false
                              : true,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.23,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      controller: _top9Prize,
                                      decoration: InputDecoration(
                                        label: Center(
                                          child: Text(
                                            'Rank 9 Prize',
                                            style: TextStyle(
                                              fontFamily: 'MSPGothic',
                                              fontSize: screenWidth * 0.034,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        isDense: true,
                                        contentPadding: const EdgeInsets.all(0.0),
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                          width: 1.2,
                                          color: Color.fromRGBO(128, 8, 12, 1),
                                        )),
                                      ),
                                    ),
                                    //SizedBox(width:screenWidth * 0.001 ,),
                                  ),
                                  Image.asset(
                                    'assets/Images/chips.png',
                                    width: screenWidth * 0.04,
                                  )
                                ],
                              ),
                              //SizedBox(width:screenWidth * 0.25 ,),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.23,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        controller: _top10Prize,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          label: Center(
                                            child: Text(
                                              'Rank 10 Prize',
                                              style: TextStyle(
                                                fontFamily: 'MSPGothic',
                                                fontSize: screenWidth * 0.034,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.all(0.0),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color.fromRGBO(128, 8, 12, 1),
                                          )),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/Images/chips.png',
                                      width: screenWidth * 0.04,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Maps DropDown
                SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.05,
                  child: DropdownButtonFormField<String>(
                    //menuMaxHeight: 200,
                    itemHeight: null,
                    hint: const Text(
                      'Choose your Map',
                      style: TextStyle(
                          color: Color.fromRGBO(128, 8, 12, 1),
                          fontFamily: 'Orbitron',
                          fontSize: 12),
                    ),
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

                    // isExpanded: true,
                    // elevation: 20,
                    onChanged: (String? newValue) {
                      setState(() {
                        defaultmapval = newValue!;
                      });
                    },
                    items: mapitems.map((String map) {
                      return DropdownMenuItem(
                        value: map,
                        child: Text(
                          map,
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
                SizedBox(
                  height: screenHeight * 0.05,
                ),

                //tpp fpp
                Visibility(
                  visible: _showrestbuttons,
                  child: ToggleButtons(
                    direction: Axis.horizontal,
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _selectedmodes.length; i++) {
                          _selectedmodes[i] = i == index;
                        }

                        _selectedModesText = (modes[index] as Text).data;
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    selectedBorderColor: const Color.fromRGBO(255, 15, 24, 1),
                    selectedColor: Colors.white,
                    fillColor: const Color.fromRGBO(255, 15, 24, 1),
                    color: const Color.fromRGBO(255, 15, 24, 1),
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 80.0,
                    ),
                    isSelected: _selectedmodes,
                    children: modes,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),


                //players
                Visibility(
                  visible: _showrestbuttons,
                  child: ToggleButtons(
                    direction: Axis.horizontal,
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _selectedplayers.length; i++) {
                          _selectedplayers[i] = i == index;
                        }
                        _selectedPlayersText = players[index].text;

                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    selectedBorderColor: const Color.fromRGBO(255, 15, 24, 1),
                    selectedColor: Colors.white,
                    fillColor: const Color.fromRGBO(255, 15, 24, 1),
                    color: const Color.fromRGBO(255, 15, 24, 1),
                    constraints: BoxConstraints(
                        minHeight: screenHeight * 0.046,
                        minWidth: screenWidth * 0.24),
                    isSelected: _selectedplayers,
                    children: players.map((iconWithText) => iconWithText.icon).toList(),
                  ),
                ),

                SizedBox(
                  height: screenHeight * 0.03,
                ),

                //Host Tournament Button
                SizedBox(
                  width: screenWidth * 0.5,
                  child: ElevatedButton(
                    onPressed: _hostTournament,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                    child: const Text(
                      'Host Tournament',
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                      ),
                    ),
                  ),
                ),

                //Cancel Button
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color.fromRGBO(255, 15, 24, 1),
                    )),
              ],
            ),
          ),
          ]),
        ),

        //Image
        floatingActionButton: Visibility(
          visible: true,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            transform:
                Matrix4.translationValues(0.0, -75, 0.0), // translate up by 30
            child: CircleAvatar(
              backgroundImage: AssetImage(img[_showimg]),
              radius: 65,
            ),
          ),
        ),
        // dock it to the center top (from which it is translated)
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }
}
