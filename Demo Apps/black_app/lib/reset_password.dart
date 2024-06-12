import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reset_password extends StatefulWidget {
  const reset_password({super.key});

  @override
  State<reset_password> createState() => _reset_password();
}

class _reset_password extends State<reset_password> {
  @override
  bool passwordObscure =true;
   bool confirm_passwordObscure =true;
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
                        "Reset Password",
                        style:GoogleFonts.openSans(
                            fontSize:30,
                            fontWeight: FontWeight.bold
                          )
                      ),
                       Text
                      (
                        "________________",
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
                  child: TextField(
                        obscureText: passwordObscure,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          label: Text(
                            'New Password',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          suffixIcon:IconButton
                          (
                            onPressed: (){
                              setState(() {
                                passwordObscure=!passwordObscure;
                              });
                            }, 
                            icon:Icon(
                              passwordObscure
                              ?Icons.visibility_off
                              :Icons.visibility,
                            )
                          ) ,
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
                  child: TextField(
                        obscureText: confirm_passwordObscure,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          label: Text(
                            'Confirm Password',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          suffixIcon:IconButton
                          (
                            onPressed: (){
                              setState(() {
                               confirm_passwordObscure=!confirm_passwordObscure;
                              });
                            }, 
                            icon:Icon(
                              confirm_passwordObscure
                              ?Icons.visibility_off
                              :Icons.visibility,
                            )
                          ) ,
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
            ],
          ),
      ),
      
    );
  }
}