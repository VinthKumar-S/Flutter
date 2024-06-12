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
        title:Text('Scaffold')

      ),
   body:Container(

     child: ButtonBar(
       alignment: MainAxisAlignment.spaceBetween,
       children:<Widget> [
        IconButton(onPressed:(){}, icon:Icon(Icons.people)),
         IconButton(onPressed:(){}, icon:Icon(Icons.home)),
         IconButton(onPressed:(){}, icon:Icon(Icons.add)),
         IconButton(onPressed:(){}, icon:Icon(Icons.search)),
       ],
     ),
   )
    );
  }
}





