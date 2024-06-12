import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _Terms();
}

class _Terms extends State<Terms> {
 
  bool checked=false;

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
              image:AssetImage('assets/terms.png'),
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
               Checkbox
               (
                value: checked, 
                activeColor: Colors.orange,
                onChanged:(value)
                {
                  setState(() {
                    //allChecked.value=!allChecked.value;
                    checked=!checked;
                  });
                }
                ),
                
                Text
                (
                  "Please accept Terms & Conditions",
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
