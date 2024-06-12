import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({super.key});

  @override
  State<forgot_password> createState() => _forgot_password();
}

class _forgot_password extends State<forgot_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body:SingleChildScrollView
      (
        child: Column
          (
            children: 
            [
                SizedBox
                (
                  height: 80,
                ),
                Container
                (
                  width: 400,
                  height: 120,
                  child: Image
                  (
                    image: AssetImage('assets/logo 1.png')
                  ),
                 
                ),
                SizedBox
                (
                  height: 40,
                ),
                Container
                (
                 // width: 400,
                  //height: 120,
                  child: Column(
                    children: [
                      Text
                      (
                        "Forgot Password",
                        style:GoogleFonts.openSans(
                            fontSize:30,
                            fontWeight: FontWeight.bold
                          )
                      ),
                       Text
                      (
                        "_________________",
                        style:GoogleFonts.openSans(
                            fontSize:30,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold
                          )
                      ),
                    ],
                  )
                 
                ),
                SizedBox
                (
                  height: 20,
                ),
                Container
                (
                  width: 310,
                  child:const TextField(
                        
                        decoration: InputDecoration(
                          hintText: 'Username',
                          label: Text(
                            'Username',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ), //<-- SEE HERE
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ), //<-- SEE HERE
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            //<-- SEE HERE
                          ),
                        
                        ),
                      ),
                ),
                Container
                (
                  width: 310,
                  child:const TextField(
                        
                        decoration: InputDecoration(
                          hintText: 'Email',
                          label: Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ), //<-- SEE HERE
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ), //<-- SEE HERE
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            //<-- SEE HERE
                          ),
                        
                        ),
                      ),
                ),
            SizedBox
            (
              height: 20,
            ),   
            Container
            (
              width: 250,
              height: 43,
              child:ElevatedButton(
              child: const Text
              (
                'Submit',
                
              ),
      
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  
                  shape: RoundedRectangleBorder
                  (
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle
                  (
                  
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
              ),
            ),
            ),
           
              Container
              (
                width: 300,
                child: Align
                (
                  alignment: Alignment.centerRight,
                  child: TextButton
                  (
                    child: Text
                    (
                      "Sign in ?",
                      style: TextStyle
                      (
                        color: Colors.white
                      ),
                    ),
                    onPressed: ()
                    {
                      
                    },
                    
                  ),
                ),
              ),
             
               
            ],
          ),
      ),
      
    );
  }
}