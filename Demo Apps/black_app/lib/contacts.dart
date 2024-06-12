import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _Contacts();
}

class _Contacts extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: 
        [
          Container
          (
            width: 200,

            child: Image
            (
              image:AssetImage('assets/contact.png'),
            ), 
          ),
          
          Container
          (
           // width: 5,
           
            child: Row(
            
              children: [

               SizedBox
               (
                width: 40,
               ),
                
                Text
                (
                  "Provide Contact Access For Better Results",
                    style:GoogleFonts.goblinOne(
                      fontSize: 9
                    )
                )
              ],
            ),
          ),
          
          Container
          (
            child:ElevatedButton(
            child: const Text
            (
              'NEXT',
              
            ),

            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize:Size(250,50) ,
                foregroundColor: Colors.white,
                textStyle: const TextStyle
                (
                
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
            ),
          ),
          )
        ],
      ),
    );
  }
}