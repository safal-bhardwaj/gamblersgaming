import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTournament extends StatefulWidget {
  const NewTournament({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewTournamentState();
  }
}


class _NewTournamentState extends State<NewTournament> {
  bool top1 = true;
  bool top2 = true;
  bool top3 = true;
  bool top5 = true;
  bool top10 = true;
  bool payperkill = true;
  bool ortext = true;
  bool _click = false;
  bool _prizepooldist = false;

  List<String> games = [
    'BGMI',
    'FreeFire',
    'Asphalt',
    'New State',
    'Call of Duty Mobile'
  ];

  Map<String, List <String>>  maps = {
    //'Choose your Map' :['Choose your Map'],
    'BGMI' : ['Erangle', 'Miramar', 'Livik', 'Sanhok', 'Vikendi', 'Karakin'],
    'FreeFire': ['Bermuda', 'Purgatory', 'Kalahari', 'Alpine'],
    'Asphalt' : ['Random'],
    'New State': ['Erangle', 'Troi'],
    'Call of Duty Mobile' : ['Classic'],
  };

  static const List<Widget> modes = <Widget>[
    Text('TPP', style: TextStyle(
      fontSize: 12,
      fontFamily: 'Orbitron'
    ),),
    Text('FPP',  style: TextStyle(
        fontSize: 12,
        fontFamily: 'Orbitron'
    ),)
  ];


  final List<bool> _selectedmodes = <bool>[true, false];
  static const List<Widget> players = <Widget>[
    Icon(Icons.person),
    Icon(Icons.group),
    Icon(Icons.group_add)
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
  DateTime? selectedDate;
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
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  Color borderColor = const Color.fromRGBO(128, 8, 12, 10);
  bool _showButton = false;
  bool _showrestbuttons = true;
  int _img = 0;
  @override
  Widget build(context) {
    String defaultmapval = '';
    String dropdownvalue = games[0];
    List<String> mapitems = maps[dropdownvalue] ?? [];
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
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
                          padding:  EdgeInsets.fromLTRB(screenWidth * 0.01,0,0, screenHeight * 0.01,),
                          child: TextButton(
                            onPressed: _presentdatepicker,
                            style:
                            TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: Row(children: [
                              const Icon(Icons.calendar_month),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ),
                              SizedBox(
                                width: screenWidth*0.3,
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
                        padding: EdgeInsets.fromLTRB(screenWidth * 0.03,0,screenWidth * 0.01, screenHeight * 0.01,),
                        child: TextButton(
                            onPressed: _timePicker,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth*0.3,
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
                                  width: screenWidth*0.02,
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
              padding: EdgeInsets.fromLTRB(screenWidth*0.01, screenHeight*0.03, screenWidth*0.01, screenHeight*0.03 ),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.05,
                    child: DropdownButtonFormField<String>(
                      //menuMaxHeight: 200,
                      itemHeight: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder( //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.5),
                        ),
                        focusedBorder:  OutlineInputBorder( //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.5),
                        ),
                        border: InputBorder.none,

                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(screenWidth * 0.032 , screenHeight * 0.01, screenWidth * 0.031, screenHeight* 0.01),
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
                          if(dropdownvalue != games[2]){

                            _showrestbuttons = true;
                          }
                          else{
                            _showrestbuttons = false;
                          }
                          if(dropdownvalue == games[0]){
                            _img = 0;
                          }
                          if(dropdownvalue == games[1]){
                            _img = 1;
                          }
                          if(dropdownvalue == games[2]){
                            _img = 2;
                          }
                          if(dropdownvalue == games[3]){
                            _img = 3;
                          }
                          if(dropdownvalue == games[4]){
                            _img = 4;
                          }
                        });
                        },
                        items: games.map((String games) {
                          return DropdownMenuItem(
                            value: games,
                            child: Text(
                              games,
                              style:
                                  const TextStyle(fontSize: 12, fontFamily: 'Orbitron', color: Color.fromRGBO(128, 8, 12, 10)),
                            ),
                          );
                          }).toList(),
                      icon: Image.asset('assets/Images/downarrow.png', width: screenWidth * 0.04,),
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
                        padding: EdgeInsets.fromLTRB(screenWidth * 0.1, screenHeight * 0.01, screenWidth * 0.01,screenHeight*0.01),
                        child: const Text(
                          'Registration Fee        :',
                          style: TextStyle(fontFamily: 'MSPGothic', fontSize: 16, color: Color.fromRGBO(255, 15, 24, 10)),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth*0.001,screenHeight * 0.01, screenWidth * 0.01,screenHeight*0.01),
                        child: Container(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.037,
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(20.5),
                            color: Colors.white
                          ),
                          child: SizedBox(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.037,
                            child: TextField(
                              focusNode: focusNode1,
                              controller: prizePool,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Color.fromRGBO(128, 8, 12, 10)),
                              decoration: InputDecoration(
                                label: const Text(''),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.fromLTRB(screenWidth * 0.03, 0, 0, screenHeight * 0.013),
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
                        padding: EdgeInsets.fromLTRB(screenWidth * 0.1, screenHeight * 0.01, screenWidth * 0.01,screenHeight*0.01),
                        child: const Text(
                          'Prize Pool                :',
                          style: TextStyle(fontFamily: 'MSPGothic', fontSize: 16, color: Color.fromRGBO(255, 15, 24, 10)),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth*0.1,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth*0.001,screenHeight * 0.01, screenWidth * 0.01,screenHeight*0.01),
                        child: Container(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.037,
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 2),
                            borderRadius: BorderRadius.circular(20.5),
                            color: Colors.white
                          ),
                          child: SizedBox(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.037,
                            child: TextField(
                              focusNode: focusNode2,
                              controller: regPrice,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: const Text(''),
                                border: InputBorder.none,
                                contentPadding:EdgeInsets.fromLTRB(screenWidth * 0.03, 0, 0, screenHeight * 0.013),
                                  ),
                              style: const TextStyle(color: Color.fromRGBO(128, 8, 12, 10)),
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
                    child: RichText(text: const TextSpan(
                          text: 'Prize',
                          style: TextStyle(
                            fontFamily: 'Orbitron',
                            color: Color.fromRGBO(255, 15, 24, 10),
                            fontSize: 16
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Distribution',
                                style: TextStyle(
                                    fontFamily: 'Orbitron',
                                    color: Colors.white,
                                  fontSize: 16
                                )
                            )
                          ]
                      ),),

                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: _showButton,
                        child:SizedBox(
                          width: screenWidth * 0.25,
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                _click = !_click;
                                if(_click == true){
                                  _prizepooldist = true;
                                  top2 = true;

                                }
                                else{
                                  _prizepooldist = false;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.5)
                                ),
                                backgroundColor:_click ? const Color.fromRGBO(128, 8, 12, 1) : Colors.white,
                                alignment: Alignment.center
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/Images/crown.png', width: 15, color:_click ? Colors.white :  Colors.black),
                                SizedBox(width: screenWidth * 0.004,),
                                Text('Top 2' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: 16,color: _click ? Colors.white : Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _showrestbuttons,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //top1
                                AnimatedPositioned(
                                  curve: Curves.easeInOut,
                                  duration: const Duration(seconds: 1),
                                  left:  top1? 20 : 0,
                                  child: Visibility(
                                    visible: top1,
                                    child: ElevatedButton(
                                      onPressed: (){
                                        setState(() {
                                          _click = !_click;
                                          if (_click == true){
                                            top2 = false;
                                            top3 = false;
                                            top5 = false;
                                            top10 = false;
                                            payperkill = false;
                                            ortext = false;
                                          }
                                          else{
                                            top3 = true;
                                            top5 = true;
                                            top10 = true;
                                            payperkill = true;
                                            ortext = true;
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.5)
                                        ),
                                        backgroundColor: _click ? const Color.fromRGBO(128, 8, 12, 1) : Colors.white,
                                          alignment: Alignment.center
                                      ),
                                      child: Row(
                                          children: [
                                            Image.asset('assets/Images/crown.png', width: screenWidth * 0.038, color: _click ? Colors.white : Colors.black),
                                            SizedBox(width: screenWidth * 0.0038,),
                                            Text('Top 1' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: screenWidth * 0.042, color:_click ? Colors.white : Colors.black))
                                          ],
                                        ),
                                    ),

                                  ),
                                ),
                                Visibility(visible: top1,
                                child: SizedBox(width: screenWidth * 0.022,)),
                                //top 3
                                Visibility(
                                  visible: top3,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        _click = !_click;
                                        if(_click == true){
                                          top1 =  false;
                                          top2 = false;
                                          top5 = false;
                                          top10 = false;
                                          payperkill = false;
                                          ortext = false;
                                          _prizepooldist = true;
                                        }
                                        else{
                                          top1 =  true;
                                          top5 = true;
                                          top10 = true;
                                          payperkill = true;
                                          ortext = true;
                                          _prizepooldist = false;
                                        }

                                      });
                                    },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.5)
                                          ),
                                          backgroundColor:_click ? const Color.fromRGBO(128, 8, 12, 1) :  Colors.white,
                                          alignment: Alignment.center
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Images/crown.png', width: screenWidth * 0.038, color: _click ? Colors.white : Colors.black),
                                        SizedBox(width: screenWidth * 0.0038,),
                                        Text('Top 3' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: screenWidth * 0.042, color:_click ? Colors.white : Colors.black))
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(visible: top3,
                                    child: SizedBox(width: screenWidth * 0.022,)),
                                //top 5
                                Visibility(
                                  visible: top5,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        _click = !_click;
                                        if(_click == true){
                                          top1 = false;
                                          top2 = false;
                                          top3 = false;
                                          top10 = false;
                                          payperkill = false;
                                          ortext = false;
                                          _prizepooldist = true;
                                        }
                                        else{
                                          top1 = true;
                                          top3 = true;
                                          top10 = true;
                                          payperkill = true;
                                          ortext = true;
                                          _prizepooldist = false;
                                        }

                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.5)
                                        ),
                                        backgroundColor:_click ? const Color.fromRGBO(128, 8, 12, 1) : Colors.white,
                                        alignment: Alignment.center
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Images/crown.png', width: screenWidth * 0.038 ,color: _click ? Colors.white : Colors.black,),
                                        SizedBox(width: screenWidth * 0.0038,),
                                        Text('Top 5' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: screenWidth * 0.042, color: _click ? Colors.white : Colors.black))
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(visible: top5,
                                    child: SizedBox(width: screenWidth * 0.022,)),
                                //top 10
                                Visibility(
                                  visible: top10,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        _click = !_click;
                                        if(_click == true){
                                          top1 = false;
                                          top2 = false;
                                          top3 = false;
                                          top5 = false;
                                          payperkill = false;
                                          ortext = false;
                                          _prizepooldist = true;
                                        }
                                        else{
                                          top1 = true;
                                          top3 = true;
                                          top5 = true;
                                          payperkill = true;
                                          ortext = true;
                                          _prizepooldist = false;
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.5)
                                        ),
                                        backgroundColor: _click ? const Color.fromRGBO(128, 8, 12, 1) : Colors.white,
                                      alignment: Alignment.center
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Images/crown.png', width: screenWidth * 0.038, color: _click ? Colors.white : Colors.black,),
                                        SizedBox(width: screenWidth * 0.0038,),
                                        Text('Top 10' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: screenWidth * 0.042,color: _click ? Colors.white : Colors.black))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),


                        SizedBox(height: screenHeight * 0.008,),
                      //or text
                      Visibility(
                        visible: ortext,
                          child: const Text('or', style:  TextStyle(fontFamily: 'Orbitron', fontSize: 17, color: Color.fromRGBO(255, 15, 24, 10)),)),
                      SizedBox(height: screenHeight * 0.008,),
                      //payperkill
                      Visibility(
                        visible: payperkill,
                        child: SizedBox(
                          width: screenWidth * 0.32,
                          child: ElevatedButton(
                            onPressed: (){
                              setState(() {
                                _click = !_click;
                                if(_click == true){
                                  ortext = false;
                                  top1 = false;
                                  top2 = false;
                                  top10 = false;
                                  top3 = false;
                                  top5 = false;
                                  _prizepooldist = true;
                                }
                                else{
                                  ortext = true;
                                  top1 = true;
                                  top10 = true;
                                  top3 = true;
                                  top5 = true;
                                  _prizepooldist = false;
                                }


                              });
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.5)
                                ),
                                backgroundColor: _click ? const Color.fromRGBO(128, 8, 12, 1) : Colors.white,
                              alignment: Alignment.center
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/Images/crown.png', width: screenWidth * 0.038, color: _click ? Colors.white : Colors.black),
                                SizedBox(width: screenWidth * 0.0038,),
                                Text('Pay per kill' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: screenWidth * 0.042, color:  _click ? Colors.white : Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ),
                      ])
                      ),


                    ],

                  ),
                  //Prize Pool Distribution
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Visibility(
                    visible: _prizepooldist,
                    child: Container(
                      width: screenWidth * 0.8,
                      height:payperkill ? screenHeight * 0.12 : top2 ? screenHeight * 0.12 : top3 ? screenHeight * 0.156: top5 ? screenHeight * 0.2 : screenHeight * 0.3,

                      decoration: BoxDecoration(
                          color: Color.fromRGBO(20, 20, 20, 1),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Visibility(
                            visible: top1 || top2 || top3 || top5 || top10 ? false : true,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 7, 15, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.25,
                                    child: const TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        label: Center(
                                          child: Text(
                                            'Prize per kill',
                                            style: TextStyle(
                                              fontFamily: 'MSPGothic',
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
                                    //SizedBox(width:screenWidth * 0.001 ,),

                                  ),
                                  Image.asset(
                                    'assets/Images/chips.png',
                                    width: screenWidth * 0.055,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: Row(
                              children: [
                                Visibility(
                                  visible:top1 || payperkill ? false : true,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: screenWidth * 0.25,
                                          child:
                                                const TextField(
                                                  textAlign: TextAlign.center,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    label: Center(
                                                      child: Text(
                                                        'Rank 1 Prize',
                                                        style: TextStyle(
                                                          fontFamily: 'MSPGothic',
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
                                                //SizedBox(width:screenWidth * 0.001 ,),

                                        ),

                                      Image.asset(
                                        'assets/Images/chips.png',
                                        width: screenWidth * 0.055,
                                      )
                                    ],
                                  ),
                                ),
                                //SizedBox(width:screenWidth * 0.25 ,),

                                      Visibility(
                                        visible: top1 || payperkill ? false : true,
                                        child:Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                          width: screenWidth * 0.25,
                                          child: const TextField(
                                            textAlign: TextAlign.center,
                                            // controller: _titlecontroller,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              label: Center(
                                                child: Text(
                                                  'Rank 2 Prize',
                                                  style: TextStyle(
                                                    fontFamily: 'MSPGothic',
                                                    fontSize: 16,
                                                    color: Colors.white
                                                    ,
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

                                      Image.asset(
                                        'assets/Images/chips.png',
                                        width: screenWidth * 0.055,
                                      )
                                    ],
                                  ),
                                ),

                            ),
                          ]),
    ),


                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),

                            child: Row(
                              children: [
                                Visibility(
                                visible: top1 || top2 || payperkill ? false : true,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.25,
                                        child:
                                        const TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            label: Center(
                                              child: Text(
                                                'Rank 3 Prize',
                                                style: TextStyle(
                                                  fontFamily: 'MSPGothic',
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                )
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
                                        //SizedBox(width:screenWidth * 0.001 ,),

                                      ),
                                      Image.asset(
                                        'assets/Images/chips.png',
                                        width: screenWidth * 0.055,
                                      )
                                    ],
                                  ),
                                ),
                                //SizedBox(width:screenWidth * 0.25 ,),
                                Visibility(
                                visible: top1 || top2 || top3 || payperkill ? false : true,
                                  child: Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.25,
                                          child: const TextField(
                                            textAlign: TextAlign.center,
                                            // controller: _titlecontroller,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              label: Center(
                                                child: Text(
                                                  'Rank 4 Prize',
                                                  style: TextStyle(
                                                    fontFamily: 'MSPGothic',
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
                                        Image.asset(
                                          'assets/Images/chips.png',
                                          width: screenWidth * 0.055,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: Row(
                              children: [
                                Visibility(
                                  visible: top1 || top2 || top3 || payperkill  ? false : true,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.25,
                                        child:
                                        const TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            label: Center(
                                              child: Text(
                                                'Rank 5 Prize',
                                                style: TextStyle(
                                                  fontFamily: 'MSPGothic',
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
                                        //SizedBox(width:screenWidth * 0.001 ,),

                                      ),
                                      Image.asset(
                                        'assets/Images/chips.png',
                                        width: screenWidth * 0.055,
                                      )
                                    ],
                                  ),
                                ),
                                //SizedBox(width:screenWidth * 0.25 ,),
                                Visibility(
                                visible: top1 || top2 || top3 || top5 || payperkill ? false : true,
                                  child: Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.25,
                                          child: const TextField(
                                            textAlign: TextAlign.center,
                                            // controller: _titlecontroller,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              label: Center(
                                                child: Text(
                                                  'Rank 6 Prize',
                                                  style: TextStyle(
                                                    fontFamily: 'MSPGothic',
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
                                        Image.asset(
                                          'assets/Images/chips.png',
                                          width: screenWidth * 0.055,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: Row(
                              children: [
                                Visibility(
                                visible: top1 || top2 || top3 || top5 || payperkill ? false : true,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.25,
                                        child:
                                        const TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            label: Center(
                                              child: Text(
                                                'Rank 7 Prize',
                                                style: TextStyle(
                                                  fontFamily: 'MSPGothic',
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
                                        //SizedBox(width:screenWidth * 0.001 ,),

                                      ),
                                      Image.asset(
                                        'assets/Images/chips.png',
                                        width: screenWidth * 0.055,
                                      )
                                    ],
                                  ),
                                ),
                                //SizedBox(width:screenWidth * 0.25 ,),
                                Visibility(
                                  visible: top1 || top2 || top3 || top5 || payperkill ? false : true,

                                  child: Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.25,
                                          child: const TextField(
                                            textAlign: TextAlign.center,
                                            // controller: _titlecontroller,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              label: Center(
                                                child: Text(
                                                  'Rank 8 Prize',
                                                  style: TextStyle(
                                                    fontFamily: 'MSPGothic',
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
                                        Image.asset(
                                          'assets/Images/chips.png',
                                          width: screenWidth * 0.055,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),
                          Visibility(
                            visible: top1 || top2 || top3 || top5 || payperkill ? false : true,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.25,
                                        child:
                                        const TextField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            label: Center(
                                              child: Text(
                                                'Rank 9 Prize',
                                                style: TextStyle(
                                                  fontFamily: 'MSPGothic',
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
                                        //SizedBox(width:screenWidth * 0.001 ,),

                                      ),
                                      Image.asset(
                                        'assets/Images/chips.png',
                                        width: screenWidth * 0.055,
                                      )
                                    ],
                                  ),
                                  //SizedBox(width:screenWidth * 0.25 ,),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.25,
                                          child: const TextField(
                                            textAlign: TextAlign.center,
                                            // controller: _titlecontroller,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              label: Center(
                                                child: Text(
                                                  'Rank 10 Prize',
                                                  style: TextStyle(
                                                    fontFamily: 'MSPGothic',
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
                                        Image.asset(
                                          'assets/Images/chips.png',
                                          width: screenWidth * 0.055,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Maps DropDown
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.05,
                        child: DropdownButtonFormField<String>(
                          //menuMaxHeight: 200,
                          itemHeight: null,
                          hint: Text('Choose your Map', style: TextStyle(
                            color: Color.fromRGBO(128, 8, 12, 1),
                            fontFamily: 'Orbitron',
                            fontSize: 12
                          ),),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder( //<-- SEE HERE
                              borderRadius: BorderRadius.circular(20.5),
                            ),
                            focusedBorder:  OutlineInputBorder( //<-- SEE HERE
                              borderRadius: BorderRadius.circular(20.5),
                            ),
                            border: InputBorder.none,

                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(screenWidth * 0.032 , screenHeight * 0.01, screenWidth * 0.031, screenHeight* 0.01),
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
                                style:
                                const TextStyle(fontSize: 12, fontFamily: 'Orbitron', color: Color.fromRGBO(128, 8, 12, 10)),
                              ),
                            );
                          }).toList(),
                          icon: Image.asset('assets/Images/downarrow.png', width: screenWidth * 0.04,),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.15,),
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
                            });
                          },
                          borderRadius: const BorderRadius.all(Radius.circular(13)),
                          selectedBorderColor: Color.fromRGBO(255, 15,24, 1),
                          selectedColor: Colors.white,
                          fillColor: Color.fromRGBO(255, 15,24, 1),
                          color:Color.fromRGBO(255, 15,24, 1),
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 80.0,
                          ),
                          isSelected: _selectedmodes,
                          children: modes,
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height:  screenHeight * 0.05,),
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
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(13)),
                      selectedBorderColor: Color.fromRGBO(255, 15,24, 1),
                      selectedColor: Colors.white,
                      fillColor: Color.fromRGBO(255, 15,24, 1),
                      color:Color.fromRGBO(255, 15,24, 1),
                      constraints: BoxConstraints(
                        minHeight: screenHeight * 0.046,
                        minWidth: screenWidth * 0.24
                      ),
                      isSelected: _selectedplayers,
                      children: players,
                    ),
                  ),








                  SizedBox(height: screenHeight * 0.03,),

                  //Host Tournament Button
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)
                        ),

                      ),
                      child: Text('Host Tournament' , style: const TextStyle(
                        fontFamily: 'Orbitron',
                      ),),
                    ),
                  ),

                  //Cancel Button
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset('assets/Images/close.png', )),
                ],
              ),
    ),])),





      //Image
      floatingActionButton: Visibility(
        visible: true,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          transform: Matrix4.translationValues(0.0, -75, 0.0),  // translate up by 30
          child: CircleAvatar(backgroundImage: AssetImage(img[_img]),radius: 65,),
        ),
      ),
      // dock it to the center top (from which it is translated)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}
