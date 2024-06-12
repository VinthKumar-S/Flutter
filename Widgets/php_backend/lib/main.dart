import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
       title: Text("Php Database"),
      ),
      body:Center(

      )
    );
  }

  Future getData() async{
  try
  {

    var url ='http://192.168.228.67/php/App_development/Flutter_test/test_backend.php';
   
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data.toString());
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }
  catch(e){
    print(e);
  }

  }
}
