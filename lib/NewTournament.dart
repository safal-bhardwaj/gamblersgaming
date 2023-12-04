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
  // int _rank1Prize = 0;
  // int _rank2Prize = 0;
  // int _rank3Prize = 0;
  // int _rank4and5Prize = 0;
  // int _rank6to10Prize = 0;
  // int _payperkillPrize = 0;

  Map<String, int> prizes = {
    'Rank 1' : 0,
    'Rank 2' : 0,
    'Rank 3' : 0,
    'Rank 4' : 0,
    'Rank 5' : 0,
    'Rank 6' : 0,
    'Rank 7' : 0,
    'Rank 8' : 0,
    'Rank 9' : 0,
    'Rank 10' : 0,
    'Pay per kill' : 0
  };
  String _maps = "";
  String _perspective = "";
  String _players = "";


  List<List<String>> _Participants = [];

  String TournamentID = "";

  void _hostTournament() async {
    _date = selectedDate!;
    _time = timeOfDay!.format(context);

    _Title = _titlecontroller.text.toUpperCase();
    _Game = dropdownvalue;
    _RegFee = int.parse(_regPrice.text);
    _PrizePool = int.parse(_prizePool.text);
    _PrizePoolDist = prizeDist;


    if(_individualPrizePoolButtons[6]){
      prizes['Pay per kill'] = int.parse(_payPerKillPrize.text);
    }
    if(_individualPrizePoolButtons[0]){
      prizes['Rank 1'] = _PrizePool;
    }
    if(_individualPrizePoolButtons[1]){
      prizes['Rank 1'] = int.parse(_top1Prize.text) ;
      prizes['Rank 2'] = int.parse(_top2Prize.text);
    }


    if(_individualPrizePoolButtons[2]){
      prizes['Rank 1'] = int.parse(_top1Prize.text) ;
      prizes['Rank 2'] = int.parse(_top2Prize.text);
      prizes['Rank 3'] = int.parse(_top3Prize.text);
    }
    if(_individualPrizePoolButtons[3]){
      prizes['Rank 1'] = int.parse(_top1Prize.text) ;
      prizes['Rank 2'] = int.parse(_top2Prize.text);
      prizes['Rank 3'] = int.parse(_top3Prize.text);
      prizes['Rank 4'] = int.parse(_top4and5Prize.text);
      prizes['Rank 5'] = int.parse(_top4and5Prize.text);
    }
    if(_individualPrizePoolButtons[4]){
      prizes['Rank 1'] = int.parse(_top1Prize.text) ;
      prizes['Rank 2'] = int.parse(_top2Prize.text);
      prizes['Rank 3'] = int.parse(_top3Prize.text);
      prizes['Rank 4'] = int.parse(_top4and5Prize.text);
      prizes['Rank 4'] = int.parse(_top4and5Prize.text);
      prizes['Rank 6'] = int.parse(_top6to10Prize.text) ;
      prizes['Rank 7'] = int.parse(_top6to10Prize.text) ;
      prizes['Rank 8'] = int.parse(_top6to10Prize.text) ;
      prizes['Rank 9'] = int.parse(_top6to10Prize.text) ;
      prizes['Rank 10'] = int.parse(_top6to10Prize.text) ;
    }







    _maps = defaultmapval;
    _perspective = _selectedPerspectiveText!;
    _players = _selectedPlayersText;
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
      "Prizes" : prizes,
      "Maps" : _maps,
      "Perspective" : _perspective,
      "Players" : _players,
    }).then((documentSnapshot) => TournamentID = documentSnapshot.id);
    ;
    print(TournamentID);
  }

// front end variables



  bool _click = false;
  bool _showButton = false;
  bool _showrestbuttons = true;
  int _showimg = 0;
  String prizeDist = "";
  late String? _selectedPerspectiveText;
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



  final List<bool> _selectedmodes = <bool>[true, false];

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
  TextEditingController _top4and5Prize = TextEditingController();
  TextEditingController _top6to10Prize = TextEditingController();
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
            colorScheme: const ColorScheme.light(
              primary: Colors.black, // <-- SEE HERE
              onPrimary: Color.fromRGBO(255, 15, 24, 1),  // <-- SEE HERE
              onSurface: Color.fromRGBO(255, 15, 24, 1), // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromRGBO(255, 15, 24, 1), // button text color
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

    return LayoutBuilder(builder: (ctx , constraints){

      final width = constraints.minWidth;
      final height = constraints.maxHeight;
      print(height);

      List<Widget> modes = <Widget>[
        Text(
          'TPP',
          style: TextStyle(fontSize: width < 500 ? 10 : 12, fontFamily: 'Orbitron'),
        ),
        Text(
          'FPP',
          style: TextStyle(fontSize: width < 500 ? 10 : 12, fontFamily: 'Orbitron'),
        )
      ];


      List<IconWithText> players = <IconWithText>[
        IconWithText(icon :  Icon(Icons.person , size: width < 500 ? 15 : 25,), text: 'single'),
        IconWithText(icon:  Icon(Icons.group , size: width < 500 ? 15 : 25), text: 'duo'),
        IconWithText(icon:  Icon(Icons.group_add , size: width < 500 ? 15 : 25), text: 'squad')
      ];

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
                                Icon(Icons.calendar_month,
                                  size: width < 500 ? 16 : 25,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.02,
                                ),
                                SizedBox(
                                  width: screenWidth * 0.3,
                                  child: Text(
                                    selectedDate == null
                                        ? 'Date'
                                        : formatter.format(selectedDate!),
                                    style: TextStyle(
                                        fontFamily: 'MSPGothic',
                                        fontSize: width < 500 ? 13 : 16
                                    ),

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
                                      style: TextStyle(
                                          fontFamily: 'MSPGothic', fontSize: width < 500 ? 13 : 16),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Icon(Icons.watch_later_outlined,
                                    size: width < 500 ? 16 : 25,
                                  ),
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
                              style: TextStyle(
                                  fontSize: width < 500 ? 10 : 12,
                                  fontFamily: 'Orbitron',
                                  color: const Color.fromRGBO(128, 8, 12, 10)),
                            ),
                          );
                        }).toList(),
                        icon: Image.asset(
                          'assets/Images/downarrow.png',
                          width: width < 500 ? screenWidth * 0.03 : screenWidth * 0.04,
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),





                    //Game Title


                    SizedBox(
                      width : screenWidth * 0.7,
                      child: Text("Title",
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
                        controller: _titlecontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            hintText: 'Tournament Name',
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


                    SizedBox(
                      height: screenHeight * 0.03,
                    ),



                    //RegistrationFee


                    SizedBox(
                      width : screenWidth * 0.7,
                      child: Text("Registration Fee",

                        style: TextStyle(
                            fontFamily: 'MSPGothic',
                            fontSize: width < 500 ? 13 : 17

                        ),),
                    ),
                    SizedBox(height: screenHeight * 0.01,),


                    SizedBox(
                      width: screenWidth * 0.7 ,
                      child: TextField(
                        style: TextStyle(
                            fontFamily: 'Orbitron',
                            color: const Color.fromRGBO(255, 15, 24, 1),
                            letterSpacing: 2,
                            fontSize: width < 500 ? 9 : 13
                        ),
                        textAlign: TextAlign.left,
                        controller: _regPrice,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            hintText: 'For ex.: 10',
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


                    SizedBox(
                      height: screenHeight * 0.03,
                    ),





                    //PrizePool


                    SizedBox(
                      width : screenWidth * 0.7,
                      child: Row(
                        children: [
                          Text("Prize Pool",

                            style: TextStyle(
                                fontFamily: 'MSPGothic',
                                fontSize: width < 500 ? 13 : 17

                            ),),
                          SizedBox(width: width < 500 ? screenWidth * 0.4 : screenWidth * 0.41,),
                          Text("4200",
                            style: TextStyle(
                                fontFamily: 'MSPGothic',
                                fontSize: width < 500 ? 13 : 17

                            ),),
                          SizedBox(width: screenWidth * 0.01,),
                          Image.asset(
                            'assets/Images/chips.png',
                            width: width < 500 ? screenWidth * 0.03 : screenWidth * 0.04,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01,),


                    SizedBox(
                      width: screenWidth * 0.7,
                      child: TextField(
                        style: TextStyle(
                            fontFamily: 'Orbitron',
                            fontSize: width < 500 ? 9 : 13,
                            color: const Color.fromRGBO(255, 15, 24, 1),
                            letterSpacing: 2
                        ),
                        textAlign: TextAlign.left,
                        controller: _prizePool,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            hintText: 'For ex.: 100',
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
                      height: height < 500 ? screenHeight * 0.025 : screenHeight * 0.008,
                    ),




                    //Prize Dist Buttons


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: _showButton,
                          child: SizedBox(
                            width: screenWidth * 0.21,
                            height: screenHeight * 0.04,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  prizeDist = "Top 2";
                                  _click = !_click;
                                  if (_click) {
                                    _individualPrizePoolButtons[0] = false;
                                    _individualPrizePoolButtons[5] = false;
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
                                          fontSize: width < 500 ? screenWidth * 0.031 : screenWidth * 0.034,
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
                                    child: SizedBox(
                                      width: width < 500 ? screenWidth * 0.21 : screenWidth * 0.19,
                                      height: screenHeight * 0.04,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            prizeDist = "Top 1";
                                            _click = !_click;
                                            if (_click) {
                                              for (int i = 1; i <_individualPrizePoolButtons.length - 1; i++) {
                                                _individualPrizePoolButtons[i] = false;
                                              }

                                            } else {
                                              for (int i = 2; i < _individualPrizePoolButtons.length - 1; i++) {
                                                _individualPrizePoolButtons[i] = true;

                                              }

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
                                            //alignment: Alignment.center
                                        ),
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
                                                    fontSize: width < 500 ? screenWidth * 0.031 : screenWidth * 0.034,
                                                    color: _click
                                                        ? Colors.white
                                                        : Colors.black))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),



                                  Visibility(
                                      visible: _individualPrizePoolButtons[0],
                                      child: SizedBox(
                                        width: width < 500 ? screenWidth * 0.02 : screenWidth * 0.022,
                                      )),



                                  //top 3


                                  Visibility(
                                    visible: _individualPrizePoolButtons[2],
                                    child: SizedBox(
                                      width: width < 500 ? screenWidth * 0.21 : screenWidth * 0.19,
                                      height: screenHeight * 0.04,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            prizeDist = "Top 3";
                                            _click = !_click;
                                            if (_click) {

                                              for (int i = 0; i < _individualPrizePoolButtons.length ; i++) {
                                                if (i== 2 ) {
                                                  _individualPrizePoolButtons[i] = true;
                                                }
                                                else if(i==7){
                                                  _individualPrizePoolButtons[i] = true;
                                                }
                                                else{
                                                  _individualPrizePoolButtons[i] = false;
                                                }

                                              }

                                            }
                                            else {

                                              for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                                if (i != 7) {
                                                  _individualPrizePoolButtons[i] = true;
                                                }
                                                else{
                                                  _individualPrizePoolButtons[7] = false;
                                                }
                                              }

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
                                                    fontSize: width < 500 ? screenWidth * 0.031 : screenWidth * 0.034,
                                                    color: _click
                                                        ? Colors.white
                                                        : Colors.black))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),



                                  Visibility(
                                      visible: _individualPrizePoolButtons[2],
                                      child: SizedBox(
                                        width: width < 500 ? screenWidth * 0.02 : screenWidth * 0.022,
                                      )),







                                  //top 5


                                  Visibility(
                                    visible: _individualPrizePoolButtons[3],
                                    child: SizedBox(
                                      width: width < 500 ? screenWidth * 0.21 : screenWidth * 0.19,
                                      height: screenHeight * 0.04,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            prizeDist = "Top 5";
                                            _click = !_click;
                                            if (_click == true) {

                                              for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                                if (i == 3) {
                                                  _individualPrizePoolButtons[i] = true;
                                                }
                                                else if(i == 7){
                                                  _individualPrizePoolButtons[i] = true;
                                                }
                                                else {
                                                  _individualPrizePoolButtons[i] = false;
                                                }
                                              }

                                            } else if(_click == false) {

                                              for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                                if (i == 7) {
                                                  _individualPrizePoolButtons[i] = false;
                                                }
                                                else{
                                                  _individualPrizePoolButtons[i] = true;
                                                }
                                              }

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
                                                    fontSize: width < 500 ? screenWidth * 0.031 : screenWidth * 0.034,
                                                    color: _click
                                                        ? Colors.white
                                                        : Colors.black))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),



                                  Visibility(
                                      visible: _individualPrizePoolButtons[3],
                                      child: SizedBox(
                                        width: width < 500 ? screenWidth * 0.019 : screenWidth * 0.022,
                                      )),




                                  //top 10


                                  Visibility(
                                    visible: _individualPrizePoolButtons[4],
                                    child: SizedBox(
                                      width: width < 500 ? screenWidth * 0.21 : screenWidth * 0.2,
                                      height: screenHeight * 0.04,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            prizeDist = "Top 10";
                                            _click = !_click;
                                            if (_click == true) {
                                              for (int i = 0;i <_individualPrizePoolButtons.length;i++) {
                                                if (i != 4) {
                                                  _individualPrizePoolButtons[i] = !_individualPrizePoolButtons[i];
                                                }
                                              }


                                            } else {
                                              for (int i = 0;i <_individualPrizePoolButtons.length ; i++) {
                                                if (i == 7) {
                                                  _individualPrizePoolButtons[i] = false;
                                                } else  {
                                                  _individualPrizePoolButtons[i] = true;
                                                }
                                              }

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
                                              width: screenWidth * 0.028,
                                              color:
                                              _click ? Colors.white : Colors.black,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.004,
                                            ),
                                            Text('Top 10',
                                                style: TextStyle(
                                                    fontFamily: 'MSPGothic',
                                                    fontSize: width < 500 ? screenWidth * 0.03 : screenWidth * 0.033,
                                                    color: _click
                                                        ? Colors.white
                                                        : Colors.black))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Visibility(
                                visible: _individualPrizePoolButtons[2] &&
                                _individualPrizePoolButtons[3] && _individualPrizePoolButtons[4] &&
                                _individualPrizePoolButtons[5] && _individualPrizePoolButtons[6] ? true : false,
                                child: SizedBox(
                                  height: height < 1000 ? screenHeight * 0.02 : screenHeight * 0.008,
                                ),
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


                              Visibility(
                                visible: _individualPrizePoolButtons[2] &&
                                    _individualPrizePoolButtons[3] && _individualPrizePoolButtons[4] &&
                                    _individualPrizePoolButtons[5] && _individualPrizePoolButtons[6] ? true : false,
                                child: SizedBox(
                                  height: height < 1000 ? screenHeight * 0.02 : screenHeight * 0.008,
                                ),
                              ),




                              //payperkill


                              Visibility(
                                visible: _individualPrizePoolButtons[5],
                                child: SizedBox(
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.04,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        prizeDist = "Pay per kill";
                                        _click = !_click;
                                        if (_click){

                                          for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                            if (i == 7) {
                                              _individualPrizePoolButtons[i] = true;
                                            }
                                            else if(i==5){
                                              _individualPrizePoolButtons[i] = true;
                                            }
                                            else {
                                              _individualPrizePoolButtons[i] = false;
                                            }
                                          }

                                        } else if(_click == false) {

                                          for (int i = 0; i < _individualPrizePoolButtons.length; i++) {
                                            if (i == 7) {
                                              _individualPrizePoolButtons[i] = false;
                                            }
                                            else if(i==5){
                                              _individualPrizePoolButtons[i] = true;
                                            }
                                            else{
                                              _individualPrizePoolButtons[i] = true;
                                            }
                                          }
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
                        width: screenWidth * 0.7,
                        height: height < 1000 ? _individualPrizePoolButtons[5] ? screenHeight * 0.12
                            : _individualPrizePoolButtons[1]
                            ? screenHeight * 0.14
                            : _individualPrizePoolButtons[2]
                            ? screenHeight * 0.2
                            : _individualPrizePoolButtons[3]
                            ? screenHeight * 0.25
                            : screenHeight * 0.3 :
                        _individualPrizePoolButtons[5] ? screenHeight * 0.11
                            : _individualPrizePoolButtons[1]
                            ? screenHeight * 0.14
                            : _individualPrizePoolButtons[2]
                            ? screenHeight * 0.17
                            : _individualPrizePoolButtons[3]
                            ? screenHeight * 0.23
                            : screenHeight * 0.28,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(20, 20, 20, 1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [




                            //prize per kill


                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                  _individualPrizePoolButtons[1] ||
                                  _individualPrizePoolButtons[2] ||
                                  _individualPrizePoolButtons[3] ||
                                  _individualPrizePoolButtons[4]
                                  ? false
                                  : true,
                              child: Row(

                                children: [
                                  Text('Prize per kill', style: TextStyle(
                                    fontSize: width < 500 ? 12 : 15,
                                  ),),

                                  SizedBox(width:width < 500 ? screenWidth * 0.26 :  screenWidth * 0.27,),
                                  SizedBox(
                                    width: screenWidth * 0.2,
                                    child: TextField(
                                      style: TextStyle(
                                          fontFamily: 'Orbitron',
                                          fontSize: width < 500 ? 9 : 13,
                                          color: const Color.fromRGBO(255, 15, 24, 1),
                                          letterSpacing: 2
                                      ),
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.number,
                                      controller: _payPerKillPrize,
                                        decoration: InputDecoration(
                                          filled: true,
                                          isDense: true,
                                          fillColor: Colors.white,
                                          //contentPadding: const EdgeInsets.all(0.0),
                                          focusedBorder: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                        ),
                                    ),
                                    //SizedBox(width:screenWidth * 0.001 ,),
                                  ),
                                  SizedBox(width : width < 500 ? 8 : 10),
                                  Image.asset(
                                    'assets/Images/chips.png',
                                    width: width < 500 ? screenWidth * 0.032 : screenWidth * 0.035,
                                  )
                                ],
                              ),
                            ),




                            //Rank 1 prize


                            Visibility(
                              visible: _individualPrizePoolButtons[0] ? false :
                                  _individualPrizePoolButtons[5]
                                  ? false
                                  :  true,
                              child: Row(
                                children: [
                                  Text('Rank 1' , style: TextStyle(
                                    fontSize: width < 500 ? 9 : 13,
                                  ),),
                                  SizedBox(width : width < 500 ? 130 : screenWidth * 0.356),

                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.2,
                                          child: TextField(
                                            style: TextStyle(
                                                fontFamily: 'Orbitron',
                                                fontSize: width < 500 ? 9 : 13,
                                                color: const Color.fromRGBO(255, 15, 24, 1),
                                                letterSpacing: 2
                                            ),
                                            textAlign: TextAlign.left,
                                            keyboardType: TextInputType.number,
                                            controller: _top1Prize,
                                            decoration: InputDecoration(
                                              filled: true,
                                              isDense: true,
                                              fillColor: Colors.white,
                                              //contentPadding: const EdgeInsets.all(0.0),
                                              focusedBorder: UnderlineInputBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ),
                                          //SizedBox(width:screenWidth * 0.001 ,),
                                        ),
                                        SizedBox(width : width < 500 ? 8 : 10),
                                        Image.asset(
                                          'assets/Images/chips.png',
                                          width: width < 500 ? screenWidth * 0.032 : screenWidth * 0.035,
                                        )
                                      ],

                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height:screenHeight * 0.02 ,),

                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                  _individualPrizePoolButtons[5] ? false : true,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Rank 2' , style: TextStyle(
                                    fontSize: width < 500 ? 9 : 12,
                                  ),),
                                  SizedBox(width : width < 500 ? 130 : screenWidth * 0.36),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.2,
                                          child: TextField(
                                            style: TextStyle(
                                                fontFamily: 'Orbitron',
                                                fontSize: width < 500 ? 9 : 13,
                                                color: const Color.fromRGBO(255, 15, 24, 1),
                                                letterSpacing: 2
                                            ),
                                            textAlign: TextAlign.left,
                                            controller: _top2Prize,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              filled: true,
                                              isDense: true,
                                              fillColor: Colors.white,
                                              enabledBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),

                                          ),
                                        ),
                                        SizedBox(width : width < 500 ? 8 : 10),
                                        Image.asset(
                                          'assets/Images/chips.png',
                                          width: width < 500 ? screenWidth * 0.032 : screenWidth * 0.035,
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),




                            SizedBox(height:screenHeight * 0.02 ,),
                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                  _individualPrizePoolButtons[1] ||
                                  _individualPrizePoolButtons[5]
                                  ? false
                                  : true,
                              child: Row(

                                children: [
                                  Text('Rank 3' , style: TextStyle(
                                fontSize: width < 500 ? 9 : 13,
                              ),),
                                  SizedBox(width : width < 500 ? 130 : screenWidth * 0.35),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.2,
                                          child: TextField(
                                            style: TextStyle(
                                                fontFamily: 'Orbitron',
                                                fontSize: width < 500 ? 9 : 13,
                                                color: const Color.fromRGBO(255, 15, 24, 1),
                                                letterSpacing: 2
                                            ),
                                            textAlign: TextAlign.left,
                                            keyboardType: TextInputType.number,
                                            controller: _top3Prize,
                                            decoration: InputDecoration(
                                              filled: true,
                                              isDense: true,
                                              fillColor: Colors.white,
                                              enabledBorder: UnderlineInputBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                            ),
                                            ),
                                        ),
                                        SizedBox(width: width < 500 ? 8 : 10,),
                                        Image.asset(
                                          'assets/Images/chips.png',
                                          width: width < 500 ? screenWidth * 0.032 : screenWidth * 0.035,
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            SizedBox(height:screenHeight * 0.02 ,),

                            Visibility(
                              visible: _individualPrizePoolButtons[0] ||
                                  _individualPrizePoolButtons[1] ||
                                  _individualPrizePoolButtons[2] ||
                                  _individualPrizePoolButtons[5]
                                  ? false
                                  : true,
                              child: Row(
                                children: [
                                  Text('Rank 4 & 5', style: TextStyle(
                                    fontSize: width < 500 ? 9 : 13,
                                  ),),
                                  SizedBox(width: width < 500 ? 115 : screenWidth * 0.31,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.2,
                                        child: TextField(
                                          style: TextStyle(
                                              fontFamily: 'Orbitron',
                                              fontSize: width < 500 ? 9 : 13,
                                              color: const Color.fromRGBO(255, 15, 24, 1),
                                              letterSpacing: 2
                                          ),
                                          textAlign: TextAlign.left,
                                          controller: _top4and5Prize,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.white,
                                            enabledBorder: UnderlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: width < 500 ? 8 : 10,),
                                      Image.asset(
                                        'assets/Images/chips.png',
                                        width: width < 500 ? screenWidth * 0.032 : screenWidth * 0.035,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),


                            SizedBox(height: screenHeight * 0.02,),
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
                                  Text('Rank 6 to 10' , style: TextStyle(
                                    fontSize: width < 500 ? 9 : 13,
                                  ),),
                                  SizedBox(width: width < 500 ? screenWidth * 0.3 : screenWidth * 0.28,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.2,
                                        child: TextField(
                                          style: TextStyle(
                                              fontFamily: 'Orbitron',
                                              fontSize: width < 500 ? 9 : 13,
                                              color: const Color.fromRGBO(255, 15, 24, 1),
                                              letterSpacing: 2
                                          ),
                                          textAlign: TextAlign.left,
                                          controller: _top6to10Prize,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.white,
                                            enabledBorder: UnderlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width : width < 500 ? 8 : 10),
                                      Image.asset(
                                        'assets/Images/chips.png',
                                        width: width < 500 ? screenWidth * 0.032 : screenWidth * 0.035,
                                      )
                                    ],
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
                      width : screenWidth * 0.4,
                      child: Text("Maps",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MSPGothic',
                            fontSize: width < 500 ? 13 : 17

                        ),),
                    ),


                    SizedBox(height: height < 500 ? screenHeight * 0.005 : screenHeight * 0.02,),

                    SizedBox(
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.05,
                      child: DropdownButtonFormField<String>(
                        //menuMaxHeight: 200,
                        itemHeight: null,
                        hint:  Text(
                          'Choose your Map',
                          style: TextStyle(
                              color: const Color.fromRGBO(128, 8, 12, 1),
                              fontFamily: 'Orbitron',
                              fontSize: width < 500 ? 10 : 12
                          ),
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.5),
                          ),
                          focusedBorder: OutlineInputBorder(

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
                              style: TextStyle(
                                  fontSize: width < 500 ? 10 : 12,
                                  fontFamily: 'Orbitron',
                                  color: const Color.fromRGBO(128, 8, 12, 10)),
                            ),
                          );
                        }).toList(),
                        icon: Image.asset(
                          'assets/Images/downarrow.png',
                          width: width < 500 ? screenWidth * 0.03 : screenWidth * 0.04,
                        ),
                      ),
                    ),







                    //tpp fpp


                    Visibility(
                      visible: _showrestbuttons,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height < 500 ? screenHeight * 0.03: screenHeight * 0.04,
                          ),
                          SizedBox(
                            width :  width < 500 ? 140 : 80.0,
                            child: Text("Perspective",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'MSPGothic',
                                  fontSize: width < 500 ? 13 : 16

                              ),),
                          ),


                          SizedBox(height : height < 500 ? screenHeight * 0.001 : screenHeight * 0.02,),

                          ToggleButtons(
                            direction: Axis.horizontal,
                            onPressed: (int index) {
                              setState(() {
                                // The button that is tapped is set to true, and the others to false.
                                for (int i = 0; i < _selectedmodes.length; i++) {
                                  _selectedmodes[i] = i == index;
                                }

                                _selectedPerspectiveText = (modes[index] as Text).data;
                              });
                            },
                            borderRadius: const BorderRadius.all(Radius.circular(13)),
                            selectedBorderColor: const Color.fromRGBO(255, 15, 24, 1),
                            selectedColor: Colors.white,
                            fillColor: const Color.fromRGBO(255, 15, 24, 1),
                            color: const Color.fromRGBO(255, 15, 24, 1),
                            constraints: BoxConstraints(
                              minHeight: height < 1000 ? 33 : 40.0,
                              minWidth: width < 500 ? 70 : 80.0,
                            ),
                            isSelected: _selectedmodes,
                            children: modes,
                          ),



                          SizedBox(
                            height: height < 500 ? screenHeight * 0.03: screenHeight * 0.04,
                          ),
                        ],
                      ),
                    ),





                    //players

                    Visibility(
                      visible: _showrestbuttons,
                      child: Column(
                        children: [
                          SizedBox(
                            width :  screenWidth* 0.72,
                            child: Text("Team",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'MSPGothic',
                                  fontSize: width < 500 ? 13 : 17

                              ),),
                          ),


                          SizedBox(height: height < 500 ? screenHeight * 0.001 : screenHeight * 0.02,),



                          ToggleButtons(
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
                                minHeight: height < 500 ? screenHeight * 0.05 : screenHeight * 0.046,
                                minWidth: screenWidth * 0.24
                            ),
                            isSelected: _selectedplayers,
                            children: players.map((iconWithText) => iconWithText.icon).toList(),
                          ),




                        ],
                      ),
                    ),





                    //Host Tournament Button


                    SizedBox(
                      height: screenHeight * 0.09,
                    ),
                    SizedBox(
                      width: screenWidth * 0.5,
                      height : screenHeight * 0.04,
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
                            fontSize: width < 500 ? 10 : 15,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height : height < 500 ? 10 : 30,),




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
              width < 500 ? Matrix4.translationValues(0.0, -63, 0.0)   :
              Matrix4.translationValues(0.0, -75, 0.0), // translate up by 30
              child: CircleAvatar(
                backgroundImage: AssetImage(img[_showimg]),
                radius: width < 500 ? 53 : 65,
              ),
            ),
          ),
          // dock it to the center top (from which it is translated)
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        ),
      );
    });

  }
}
