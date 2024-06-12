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
  String val='';
  void _onChanged(String value){
    setState(() {
      val=value;
    });
  }
  void _onSubmit(String value){
    setState(() {
      val=value;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textfield'),
      ),
      body: Column(
        children:<Widget> [
          Text(val),
          TextField(
            onChanged: _onChanged ,
            onSubmitted: _onSubmit,
            decoration: new InputDecoration(
              labelText: 'Enter Name',
              hintText: 'Full Name'
             ,   icon:new  Icon(Icons.people)

            ),
            keyboardType: TextInputType.text,
          )
        ],
      ),
    );
  }
}






