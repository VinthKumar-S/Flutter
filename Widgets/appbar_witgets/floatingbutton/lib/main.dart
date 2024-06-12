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
        title:Text('Floading Button')
      ),
      body:Center(
        child:Text('App Body',
          style:TextStyle(
            fontSize:28.0,
            color: Colors.blueGrey
          )
        ),

      ),

      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(Icons.add),
        onPressed: (){
          print('Clicked');
        },

      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      
    );
  }
}





