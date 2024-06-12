import 'package:flutter/material.dart';

class send_success extends StatefulWidget {
  const send_success({super.key});

  @override
  State<send_success> createState() => _send_success();
}

class _send_success extends State<send_success> {
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
                  height: 80,
                ),
                Container
                (
                  width: 300,
                  height: 200,
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      Image
                     (
                        image: AssetImage('assets/verify.png')
                     ),
                     SizedBox
                     (
                      height: 20,
                     ),
                     Text
                     (
                      "Successfully Account Activated"
                      ,style: TextStyle
                      (
                        fontWeight: FontWeight.bold
                      ),
                    ),
                     
                    SizedBox
                    (
                      height: 30,
                    )
                    ],
                  ),
                   decoration: BoxDecoration
                   (
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                   borderRadius: BorderRadius.all
                   (
                      Radius.circular(10),
                   ),
                    boxShadow: 
                    [
                     BoxShadow
                     (
                      color: Color(0xffDDDDDD),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 0.0),
                     )
                    ],
                  ),
                ),
                SizedBox
                (
                  height: 60,
                ),
          
            ],
          ),
      ),
      
    );
  }
}