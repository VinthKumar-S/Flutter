import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final control =ConfettiController();
  bool isPlaying=false;
  void dispose()
  {
    super.dispose();
    control.dispose();
  }
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.topCenter,
      children: [
    Scaffold(
    appBar:AppBar(
    title:Text('Confetti')
    ),
    body:Center(
    child: MaterialButton(
    onPressed: ()
    {
    if(isPlaying){
    control.stop();
    }
    else{
    control.play();
    }
    isPlaying= !isPlaying;
    },
    child: Text('Click'),
    color: Colors.blue,
    ),
    ),
    ),
        ConfettiWidget(confettiController: control,
          blastDirection: pi/2,
          colors: [
            Colors.cyan,
            Colors.deepOrange,
            Colors.green
          ],
          gravity: 0.01,
          emissionFrequency: 0.1,
        ),
      ],
    );


  }
}






