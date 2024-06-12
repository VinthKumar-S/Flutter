import 'package:black_app/register.dart';
import 'package:black_app/reset_password.dart';
import 'package:flutter/material.dart';
import 'contacts.dart';
import 'forgot_password.dart';
import 'fp_send_link.dart';
import 'home.dart';
import 'location.dart';
import 'login.dart';
import 'send_successfull.dart';
import 'splash.dart';
import 'terms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.orange
      ),
      home: Home(),
    );
  }
}

