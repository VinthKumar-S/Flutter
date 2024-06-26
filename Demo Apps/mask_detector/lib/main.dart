import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget 
{
 // const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return  MaterialApp
    (
      theme: ThemeData
      (
        brightness: Brightness.light,
        primarySwatch: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}