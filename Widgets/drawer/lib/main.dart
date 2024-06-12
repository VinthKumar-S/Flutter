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
        title:Text('Drawer'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){

          },

        ),

      ),
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text('VinithKumar'), accountEmail:Text('vk3228433@gmail.com'),currentAccountPicture:CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('Xyz'),
            ),),

          ],
        ),
      ),
    );
  }
}





