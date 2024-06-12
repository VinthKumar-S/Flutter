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
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
   int active=0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Scaffold')
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: active,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(
             icon: Icon(Icons.home),label:'Home',),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),label:'Search',),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),label:'Add',),
        ],
        onTap: (int index){
          setState(() {
              active=index;
          });
          print(index.toString());
        },
      ),
    );
  }
}




