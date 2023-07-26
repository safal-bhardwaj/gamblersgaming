import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class SearchScreen extends StatefulWidget{
   SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  List<Map<String, dynamic>> _searchResults = [];

  //Backend
    void _performSearch(String _searchQuery) async
    {
      print(_searchResults);
      if(_searchQuery!=null && _searchQuery!="" ) {
        await FirebaseFirestore.instance.collection("Hosted Tournaments").where(
            'Title', isGreaterThanOrEqualTo: _searchQuery)
            .where('Title', isLessThan: _searchQuery + 'z').limit(10).get().then(
              (querySnapshot) {
            print("Successfully completed");

            setState(() {
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
    return Scaffold(

      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 75, 25, 25),
            child: Container(
              height: 30,
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
                  hintStyle: TextStyle(color: Color.fromRGBO(70, 70, 70, 0.6),fontFamily: 'orbitron',fontSize: 12),
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 20, 13),
                  border: InputBorder.none,

                ),
                style: TextStyle(
                  color: Colors.black,
                    fontFamily: 'orbitron',fontSize: 12
                ),
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              return InkWell(
                splashColor: Color.fromRGBO(225, 15, 24, 1 ),
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 20, 20, 1),
                      borderRadius: BorderRadius.circular(13)
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13)),
                            child: Image.asset(_searchResults[index]["Game_Image"],height: 90,fit: BoxFit.cover,)),
                        Column(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [Text(_searchResults[index]["Title"]))],
                            )
                          ],
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
  }
}