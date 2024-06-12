import 'package:flutter/material.dart';

class Stateful extends StatefulWidget {

  @override
  State<Stateful> createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFul'),
      ),
      body: Center(
       
      ),
    );
  }
}
