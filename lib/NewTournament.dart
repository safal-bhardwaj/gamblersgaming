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
  String dropdownvalue = 'Select Game';
  var items = [
    'Select Game',
    'FreeFire',
    'Asphalt',
    'BGMI',
    'Call of Duty Mobile'
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
  @override
  Widget build(context) {
    return Container(
      color: Colors.black,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.8,
        child: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.fromLTRB(16,16,16,MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Align(
                    child: Container(
                      color: Colors.white,
                      child: DropdownButton<String>(
                  value: dropdownvalue,
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,

                        child: Text(
                          items,
                          style:
                              const TextStyle(fontSize: 17, fontFamily: 'Orbitron', color: Color.fromRGBO(128, 8, 12, 10)),
                        ),
                      );
                  }).toList(),

                  onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        _showButton = dropdownvalue == items[2];
                      });
                  },
                ),
                    )),
                Visibility(
                  visible: _showButton,
                    child: ElevatedButton(
                      onPressed: () {  },
                      child: Text('button'),

                    )
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _titlecontroller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      'Tournament Name',
                      style: TextStyle(
                          fontFamily: 'MSPGothic',
                          fontSize: 20,
                          color: Colors.white),
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
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    //Date-picker
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: _presentdatepicker,
                          style:
                              TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                ),
                          child: Row(children: [
                            const Icon(Icons.calendar_month),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              selectedDate == null
                                  ? 'Date'
                                  : formatter.format(selectedDate!),
                              style: const TextStyle(
                                  fontFamily: 'MSPGothic', fontSize: 17),
                            ),
                          ]),
                        ),
                      ],
                    )),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: _timePicker,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.watch_later_outlined),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    timeOfDay == null
                                        ? 'Time'
                                        : timeOfDay!.format(context).toString(),
                                    style: const TextStyle(
                                        fontFamily: 'MSPGothic', fontSize: 17),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(85,8,8,8),
                      child: const Text(
                        'Prize Pool:',
                        style: TextStyle(fontFamily: 'MSPGothic', fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(1,8,8,8),
                      child: Container(
                        width: 90,
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: SizedBox(
                          width: 90,
                          height: 25,
                          child: TextField(
                            focusNode: focusNode1,
                            controller: prizePool,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text(''),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/Images/chips.png',
                      width: 20,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(85,8,8,8),
                      child: const Text(
                        'Reg. Fee:',
                        style: TextStyle(fontFamily: 'MSPGothic', fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12,8,8,8),
                      child: Container(
                        width: 90,
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: SizedBox(
                          width: 90,
                          height: 25,
                          child: TextField(
                            focusNode: focusNode2,
                            controller: regPrice,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text(''),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                )),
                          ),
                        ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/Images/chips.png',
                      width: 20,
                    )
                  ],
                ),
                const SizedBox(height: 15),
                const Text('Prize Distribution', style:  TextStyle(fontFamily: 'Orbitron', fontSize: 20, color: Color.fromRGBO(255, 15, 24, 10)),),
                Row(
                  children: [
                    TextButton(
                      onPressed: (){ },
                      style: TextButton.styleFrom(
                        side: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(128, 8, 12, 10),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)
                        ),
                        foregroundColor: Colors.white
                      ),

                      child: Row(
                          children: [
                            Image.asset('assets/Images/crown.png', width: 20, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text('Top 1' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: 17,),),
                          ],
                        ),
                    ),
                    SizedBox(width: 9,),
                    TextButton(
                      onPressed: (){ },
                      style: TextButton.styleFrom(
                          side: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(128, 8, 12, 10),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                          ),
                          foregroundColor: Colors.white
                      ),

                      child: Row(
                        children: [
                          Image.asset('assets/Images/crown.png', width: 20, color: Colors.white,),
                          SizedBox(width: 5,),
                          Text('Top 3' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: 17,),),
                        ],
                      ),
                    ),
                    SizedBox(width: 9,),
                    TextButton(
                      onPressed: (){ },
                      style: TextButton.styleFrom(
                          side: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(128, 8, 12, 10),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                          ),
                          foregroundColor: Colors.white
                      ),

                      child: Row(
                        children: [
                          Image.asset('assets/Images/crown.png', width: 20, color: Colors.white,),
                          SizedBox(width: 5,),
                          Text('Top 5' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: 17,),),
                        ],
                      ),
                    ),
                    SizedBox(width: 9,),
                    TextButton(
                      onPressed: (){ },
                      style: TextButton.styleFrom(
                          side: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(128, 8, 12, 10),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)
                          ),
                          foregroundColor: Colors.white
                      ),

                      child: Row(
                        children: [
                          Image.asset('assets/Images/crown.png', width: 20, color: Colors.white,),
                          SizedBox(width: 5,),
                          Text('Top 10' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: 17,),),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 9,),
                const Text('or', style:  TextStyle(fontFamily: 'Orbitron', fontSize: 20, color: Color.fromRGBO(255, 15, 24, 10)),),
                SizedBox(height: 9,),
                Container(
                  width: 150,
                  child: TextButton(
                    onPressed: (){ },
                    style: TextButton.styleFrom(
                        side: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(128, 8, 12, 10),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)
                        ),
                        foregroundColor: Colors.white
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/Images/crown.png', width: 20, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text('Pay per kill' , style:  TextStyle(fontFamily: 'MSPGothic', fontSize: 17,),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 15, 24, 10)),
                  child: const Text('Host Tournament'),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset('assets/Images/close.png', width: 80, height: 80,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
