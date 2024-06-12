import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        
      ),
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(
             icon: Image.asset("assets/elite.png"),label:'Elite',),
          BottomNavigationBarItem(
            icon: Image.asset("assets/like.png"),label:'Like',),
          BottomNavigationBarItem(
            icon: Image.asset("assets/party.png"),label:'Party',),
             BottomNavigationBarItem(
            icon: Image.asset("assets/shop.png"),label:'Shop',),
            BottomNavigationBarItem(
            icon: Image.asset("assets/chat.png"),label:'Chat',), 
        ],
        onTap: (int index){
          print(index.toString());
        },
      ) ,
    );
  }
}