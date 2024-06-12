import 'package:flutter/material.dart';

class Stacks extends StatefulWidget {

  @override
  State<Stacks> createState() => _StacksState();
}

class _StacksState extends State<Stacks> {
String selectedValue ='Orange';
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Container(
       color: Colors.blue,
       child: Center(
        child: Stack(
          children: [
            Center(child: Container(height: 300,width: 300,color:Colors.yellow),),
                Center(child: Container(height: 150,width: 150,color:Colors.red),),
                    Center(child: Container(height: 50,width: 50,color:Colors.green),),
          ],
        ),
       ),
      ),
    );
  }
}
