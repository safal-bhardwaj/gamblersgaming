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
  final _titlecontroller = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  @override
  void initState() {
    timeInput.text = ""; //set the initial value of text field
    super.initState();
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

  @override
  Widget build(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titlecontroller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text('Tournament Name'),
                ),
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
                        style: TextButton.styleFrom(
                          foregroundColor: Color.fromRGBO(255, 15, 24, 10)
                        ),
                        child: Row(children: [
                          Text(selectedDate == null
                              ? 'Select Date'
                              : formatter.format(selectedDate!)),
                          Icon(Icons.calendar_month),
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
                              foregroundColor: Color.fromRGBO(255, 15, 24, 10),
                            ),
                            child: Row(
                              children: [
                                Text(timeOfDay == null
                                    ? 'Select Time'
                                    : timeOfDay!.format(context).toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.watch_later_outlined),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 15, 24, 10)),
                child: const Text('Host Tournament'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
