import 'package:flutter/material.dart';

class active_link_send extends StatefulWidget {
  const active_link_send({super.key});

  @override
  State<active_link_send> createState() => _active_link_send();
}

class _active_link_send extends State<active_link_send> {
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
                        image: AssetImage('assets/message.png')
                     ),
                     SizedBox
                     (
                      height: 20,
                     ),
                     Text
                     (
                      "Account Activation Send to Registered Email"
                      ,style: TextStyle
                      (
                        fontWeight: FontWeight.bold
                      ),
                    ),
                     SizedBox
                     (
                      height: 10,
                     ),
                     Text
                     (
                      "Kindly Check your Inbox"
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
            Container
            (
              width: 250,
              height: 43,
              child:ElevatedButton(
              child: const Text
              (
                'Sign in',
                
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
       
            ],
          ),
      ),
      
    );
  }
}