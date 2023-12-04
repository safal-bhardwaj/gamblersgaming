
import 'package:flutter/material.dart';
import 'package:gamblersgaming/AccountScreen.dart';
import 'package:gamblersgaming/Home.dart';
import 'package:gamblersgaming/HomeScreen.dart';
import 'Home.dart';
import 'SearchScreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(context) {
    Widget activePage = const HomeScreen();
    if(_selectedPageIndex == 1){
      activePage = SearchScreen();
    }
    if(_selectedPageIndex == 2){
      activePage = const Home();
    }
    if(_selectedPageIndex == 3){
      activePage =  Account_Screen();
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: activePage,
      bottomNavigationBar: Container(
        height: screenHeight * 0.065,
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Color.fromRGBO(128, 8, 12, 10), width: 2.0)),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(width: screenWidth * 0.05,child: Image.asset('assets/Images/homeicon1.png')),
              activeIcon: SizedBox(width: screenWidth * 0.053,child: Image.asset('assets/Images/homeicon.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: screenWidth * 0.053,
                  child: Image.asset('assets/Images/loupe.png')),
              activeIcon: SizedBox(
                  width: screenWidth * 0.058,
                  child: Image.asset('assets/Images/loupe1.png')),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: screenWidth * 0.05,child: Image.asset('assets/Images/leaderboard1.png')),
              activeIcon: SizedBox(width: screenWidth * 0.055 ,child: Image.asset('assets/Images/leaderboard.png')),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: screenWidth * 0.045,child: Image.asset('assets/Images/usericon.png')),
              activeIcon: SizedBox(width: screenWidth * 0.05 ,child: Image.asset('assets/Images/usericon1.png')),

              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: 'MSPGothic', fontSize: fontSize * 10, height: screenHeight * 0.0018),
          unselectedLabelStyle: TextStyle(fontFamily: 'MSPGothic', fontSize: fontSize * 10, height: screenHeight * 0.0018),
          currentIndex: _selectedPageIndex,
          selectedItemColor: const Color.fromRGBO(255, 15, 24, 10),
          backgroundColor: Color.fromRGBO(20, 20, 20, 1),
          unselectedItemColor: Colors.white,
          //iconSize: 40,
          showSelectedLabels: true,
          onTap: _selectPage,
          //elevation: 5,

        ),
      ),
    );
  }
}
