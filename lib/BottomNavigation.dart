import 'package:flutter/material.dart';
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
      activePage = const Home();
    }
    if(_selectedPageIndex == 2){
      activePage = const Home();
    }
    if(_selectedPageIndex == 3){
      activePage = const Home();
    }
    return Scaffold(
      body: activePage,
      bottomNavigationBar: Container(

        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Color.fromRGBO(128, 8, 12, 10), width: 2.0)),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(width: 20,child: Image.asset('assets/Images/homeicon1.png')),
              activeIcon: SizedBox(width: 24,child: Image.asset('assets/Images/homeicon.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 22,
                  child: Image.asset('assets/Images/loupe.png')),
              activeIcon: SizedBox(
                  width: 26,
                  child: Image.asset('assets/Images/loupe1.png')),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: 24,child: Image.asset('assets/Images/leaderboard1.png')),
              activeIcon: SizedBox(width: 28,child: Image.asset('assets/Images/leaderboard.png')),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: 20,child: Image.asset('assets/Images/usericon.png')),
              activeIcon: SizedBox(width: 24,child: Image.asset('assets/Images/usericon1.png')),

              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: 'MSPGothic', fontSize: 12, height: 1.2),
          unselectedLabelStyle: TextStyle(fontFamily: 'MSPGothic', fontSize: 12,  height: 1.2),
          currentIndex: _selectedPageIndex,
          selectedItemColor: const Color.fromRGBO(255, 15, 24, 10),
          backgroundColor: Color.fromRGBO(20, 20, 20, 1),
          unselectedItemColor: Colors.white,
          iconSize: 40,
          showSelectedLabels: true,
          onTap: _selectPage,
          elevation: 5,
        ),
      ),
    );
  }
}
