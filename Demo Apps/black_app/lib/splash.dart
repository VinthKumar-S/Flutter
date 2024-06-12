import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: 
        [
          Container
          (
            width: 400,
            height: 200,
            child: Image(image:AssetImage('assets/logo 1.png'),), 
          ),
          
        ],
      ),
    );
  }
}