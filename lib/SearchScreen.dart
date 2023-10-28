import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/Tournament_Screen.dart';
import 'package:intl/intl.dart';




class SearchScreen extends StatefulWidget{
   SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  // Variables


  String _searchQuery = '';
  List<Map<String, dynamic>> _searchResults = [];
  String _docName = '' ;
  final formatter = DateFormat.yMMMMd('en_US');


  //Backend


    void _performSearch(String _searchQuery) async
    {

      if(_searchQuery!=null && _searchQuery!="" ) {
        await FirebaseFirestore.instance.collection("Hosted Tournaments").where(
            'Title', isGreaterThanOrEqualTo: _searchQuery)
            .where('Title', isLessThan: _searchQuery + 'z').limit(10).get().then(
              (querySnapshot) {
            print("Successfully completed");


            setState(() {
              _docName = querySnapshot.docs.toString();
              _searchResults =
                  querySnapshot.docs.map((doc) => doc.data()).toList();
            });
          },
          onError: (e) => print("Error completing: $e"),
        );

      }


    }


  @override
  Widget build(BuildContext context) {

      return LayoutBuilder(builder: (ctx , constraints){

        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;


        return Scaffold(

          backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
          body: Column(
            children: [

              // Search Bar

              Padding(
                padding: const EdgeInsets.fromLTRB(25, 75, 25, 25),
                child: Container(
                  height: height < 1000 ? 30 :  40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: TextField(onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                    _performSearch(_searchQuery);

                  },
                    decoration: InputDecoration(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Image.asset("assets/Images/loupe1.png", width: 20,height: 20,),
                      ),
                      hintText: 'Search Game / Tournament Name or ID',
                      hintStyle: const TextStyle(color: Color.fromRGBO(70, 70, 70, 0.6),fontFamily: 'orbitron',fontSize: 12),
                      contentPadding: const EdgeInsets.fromLTRB(0, 10, 20, 13),
                      border: InputBorder.none,

                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'orbitron',fontSize: width < 500 ? 9 : 12
                    ),
                  ),
                ),
              ),


              // Searched List





              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        splashColor: const Color.fromRGBO(225, 15, 24, 1 ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Tournament_Screen(Tournament: _searchResults[0])));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: screenHeight * 0.1,

                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(20, 20, 20, 1),
                                borderRadius: BorderRadius.circular(13)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: const
                                    BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13)),
                                    child: Image.asset(_searchResults[index]["Game_Image"],
                                      height: screenHeight * 0.1,
                                      fit: BoxFit.cover,)
                                ),
                                Expanded(
                                  child: Container(
                                    padding : width < 500 ? EdgeInsets.all(5.0) : EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(border: Border(
                                              bottom: BorderSide(width: 1,
                                                  color: Color.fromRGBO(128, 8, 12, 1)))),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            children: [Text(_searchResults[index]["Title"] , style: TextStyle(
                                                fontFamily: "orbitron",
                                              fontSize: width < 500 ? 10 : 15
                                            ),),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.people,
                                                    color: Color.fromRGBO(
                                                        128, 8, 12, 1),),

                                                  const SizedBox(width: 3,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 5.0),
                                                    child: Text(
                                                      "${_searchResults[index]["Participants"]
                                                          .length}/${_searchResults[index]["Game"] ==
                                                          "Asphalt" ? 8 : 100}",
                                                      style: TextStyle(fontSize: width < 500 ? 12 : 16,
                                                          fontFamily: "MSPGothic"),

                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),


                                        SizedBox(height: height < 1000 ? screenHeight * 0.009 : screenHeight * 0.013,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${formatter.format(
                                                DateTime.fromMillisecondsSinceEpoch(
                                                    _searchResults[index]["Date"].seconds *
                                                        1000))}", style: TextStyle(
                                                fontSize: width < 500 ? 10 :15, fontFamily: "MSPGothic"),
                                            ),
                                            Text(_searchResults[index]["Time"], style:  TextStyle(
                                                fontSize:  width < 500 ? 10 :15, fontFamily: "MSPGothic"),)

                                          ],
                                        ),

                                        SizedBox(height: height < 1000 ? screenHeight * 0.009 : screenHeight * 0.013,),
                                        Row(
                                          mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Fee : ${
                                                _searchResults[index]["Registration Fee"]}", style: TextStyle(
                                                fontSize:  width < 500 ? 10 :15, fontFamily: "MSPGothic"),
                                            ),
                                            Text(""
                                                "Prize Pool : ${_searchResults[index]["Prize Pool"]}", style: TextStyle(
                                                fontSize:  width < 500 ? 10 :15, fontFamily: "MSPGothic"),
                                            )
                                          ],
                                        ),


                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    );
                  },
                ),
              ),
            ],
          ),
        );
      });

  }
}