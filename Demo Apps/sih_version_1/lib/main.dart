import 'package:flutter/material.dart';
import 'package:sih_version_1/pages/homePage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         debugShowCheckedModeBanner: false,
      theme: ThemeData(
        tabBarTheme: TabBarTheme(labelColor:Colors.white),
        scaffoldBackgroundColor: Color.fromARGB(225, 254, 250, 224),
        appBarTheme:AppBarTheme(
           backgroundColor: const Color.fromARGB(255, 95, 111, 82),
           
        ),
      ),
      home: homePage(),
    );
     
  }
}

