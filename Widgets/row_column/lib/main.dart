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
        title:Text('Scaffold')
      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [

          Container(
            color: Colors.red,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
        ],
      )
    );
  }
}





