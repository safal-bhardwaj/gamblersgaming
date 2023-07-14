import 'package:flutter/material.dart';
import 'package:gamblersgaming/Home.dart';
import 'package:gamblersgaming/HomeScreen.dart';
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
              icon: SizedBox(width: 25,child: Image.asset('assets/Images/homeicon1.png')),
              activeIcon: SizedBox(width: 25,child: Image.asset('assets/Images/homeicon.png')),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 25,
                  child: Image.asset('assets/Images/loupe.png')),
              activeIcon: SizedBox(
                  width: 25,
                  child: Image.asset('assets/Images/loupe1.png')),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: 25,child: Image.asset('assets/Images/leaderboard1.png')),
              activeIcon: SizedBox(width: 25,child: Image.asset('assets/Images/leaderboard.png')),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: 25,child: Image.asset('assets/Images/usericon.png')),
              activeIcon: SizedBox(width: 25,child: Image.asset('assets/Images/usericon1.png')),
              label: ' ',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPageIndex,
          selectedItemColor: const Color.fromRGBO(255, 15, 24, 10),
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          iconSize: 40,
          onTap: _selectPage,
          elevation: 5,
        ),
      ),
    );
  }
}
