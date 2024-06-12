import 'dart:math';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';
import 'package:confetti/confetti.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Present',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan[400],
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final control = ConfettiController();
  bool isPlaying = false;
  void dispose() {
    super.dispose();
    control.dispose();
  }

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.cyan[100],
          appBar: AppBar(
            title: Text('Gift'),
            backgroundColor: Colors.cyan[400],
          ),
          body: Column(children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/20230313_082619.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/eyes (2).jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/eye(5).jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/1682529052951.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),

                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/20230314_180652.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),
                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/20230313_195353.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),
                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/eyes(4).jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),
                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/eyes(8).jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),
                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('sc/20230314_180652.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.cyan[100]),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                height: 500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                showScratchCard(context);
                if (isPlaying) {
                  control.stop();
                } else {
                  control.play();
                }
                isPlaying = !isPlaying;
              },
              child: Text(
                'Click',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan[400],
              elevation: 5,
              minWidth: 100.0,
              height: 50.0,
            ),
          ]),
        ),
        ConfettiWidget(
          confettiController: control,
          blastDirection: pi / 2,
          colors: [Colors.cyan, Colors.deepOrange, Colors.green],
          gravity: 0.01,
          emissionFrequency: 0.1,
        ),
      ],
    );
  }
}

showScratchCard(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Scratcher(
            brushSize: 100,
            threshold: 50,
            color: Colors.cyan,
            onChange: (value) => print("Scratch progress: $value%"),
            onThreshold: () => print("Threshold reached"),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.32,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset(
                      "sc/wish.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "My Cake is Virtual",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: Colors.blue),
                    ),
                  ),
                  Text(
                    "But Heart is Original",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
