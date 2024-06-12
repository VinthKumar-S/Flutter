import 'package:flutter/material.dart';

class Positions extends StatefulWidget {

  @override
  State<Positions> createState() => _PositionsState();
}

class _PositionsState extends State<Positions> {
String selectedValue ='Orange';
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Positions'),
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
             height:MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/Sam Willson.jpg'),
              fit: BoxFit.cover
              )
             ),
            ))
        ],
      ),
    );
  }
}
