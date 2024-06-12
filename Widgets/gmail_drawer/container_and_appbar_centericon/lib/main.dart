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
class Home extends StatelessWidget {


  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text(''),
        flexibleSpace:SafeArea(
          child:Icon(
          Icons.camera,
          color:Colors.white,
            size:40.0,
          )

    ),
        bottom:PreferredSize(

          child:Container(
            color:Colors.deepOrange,
                height: 75.0,
            width: double.infinity,
            child:Center(
            child:Text(
              'Container',
              style:TextStyle(
                color:Colors.white,
                  fontSize: 25,

              ),
            ),


            )
          ),
          preferredSize: Size.fromHeight(75.0),
        ),
      ),
    );
  }
}





