import 'package:flutter/material.dart';

class contactPage extends StatefulWidget {
  const contactPage({super.key});

  @override
  State<contactPage> createState() => _contactPage();
}

class _contactPage extends State<contactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: 180,
            height: 180,
            child: ElevatedButton(
              
              onPressed: (){}, 
              child:Text("SOS",style:TextStyle(
                color: Colors.white,
                fontSize:40
              ))
              ,style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                elevation: 20,
                shape: CircleBorder()
              ),
              ),
          ),
        ),
    );
  }
}