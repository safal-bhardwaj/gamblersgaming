import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gamblersgaming/NewTournament.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(context) {

    final List<String> imageList = [
      'assets/Images/img1.png',
      'assets/Images/img2.png',
      'assets/Images/img3.png',
    ];
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    void _openAddTournamentOverlay(){
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const NewTournament();
        },
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 10),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/Images/GGLogo.png',
                width: screenWidth * 0.3,
                height: screenHeight * 0.09,
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 0.47,
                    height: screenHeight * 0.36,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    reverse: false,
                  ),
                  itemBuilder: (context, i, id){
                    //for onTap to redirect to another screen
                    return GestureDetector(
                      child: Container(
                        width: screenWidth * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            //border: Border.all(color: Colors.white,)
                        ),
                        //ClipRRect for image border radius
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            imageList[i],
                            width: screenWidth * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.03,),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.06,
                  child: RichText(text: const TextSpan(
                    text: 'Recent',
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      color: Color.fromRGBO(255, 15, 24, 10),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Tournaments:',
                        style: TextStyle(
                          color: Colors.white
                        )
                      )
                    ]
                  ),),
                ),
              ),
              const SizedBox(height: 240,)
            ],
          )
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(255, 15, 24, 10),
          onPressed: _openAddTournamentOverlay,
          child: Image.asset('assets/Images/Gamer/game-controller (3).png', width: 43, color: Colors.white,),
        ),
      ),

    );
  }
}
