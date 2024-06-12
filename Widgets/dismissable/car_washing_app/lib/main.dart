import 'package:flutter/material.dart';
import 'package:car_washing_app/pages/Login/user_check.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 35, 208, 231),
      )),
      home: UserCheck(),
    );
  }
}
