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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollView'),

      ),
      body: SingleChildScrollView(
        child:Row (
          children:<Widget>[
          Container(
            height: 250,
            color: Colors.red,
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 250,
            color: Colors.orange,
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 250,
            color: Colors.green,
          ),
          SizedBox(height: 10.0,),
  ]
        ),

      ),
    );
  }
}






