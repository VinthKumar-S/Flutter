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
        leading:IconButton(
          icon:Icon(Icons.menu),
          onPressed:()
            {
              print('Menu Clicked');
            }
        ),
        title:Text('AppBar Widgets'),
          actions:<Widget>[
            IconButton(onPressed: (){}, icon:Icon(Icons.search)),
            IconButton(onPressed: (){}, icon:Icon(Icons.more))
          ],
      ),

    );
  }
}





