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
class Home extends StatelessWidget {


  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Scaffold'),
      ),
      body:Container(
        height: 300,
        width: double.infinity,
        color: Colors.blue,
        child: Image(
          image:AssetImage('sc/img.png'),
          fit: BoxFit.cover,
        ),
      )
    );
  }
}





