import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  bool passwordObscure =true;
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
                        "Login",
                        style:GoogleFonts.openSans(
                            fontSize:30,
                            fontWeight: FontWeight.bold
                          )
                      ),
                       Text
                      (
                        "____",
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
                 Container
                (
                  width: 310,
                  child: TextField(
                        obscureText: passwordObscure,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          label: Text(
                            'Password',
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
            SizedBox
            (
              height: 20,
            ), 
            Container
            (
              width: 200,
              height: 43,
              child:ElevatedButton(
              child: const Text
              (
                'Login',
                
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
                child: TextButton
                (
                  child: Text
                  (
                    "Forgot Password ?",
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
              SizedBox(
                height: 20,
              ),
              Container
              (
                width: 280,
                height: 43,
                child: ElevatedButton.icon
                (
                  icon: Image.asset("assets/f.png"),
                  label: Text
                  (
                    'Facebook',
                    style: TextStyle
                    (
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    side: const BorderSide
                    (
                      width: 1.0,
                      color: Colors.white,
                    )
                  ),
                ),
              ),
               SizedBox(
                height: 20,
              ),
              Container
              (
                width: 280,
                height: 40,
                child: ElevatedButton.icon
                (
                  icon: Image.asset("assets/g.png"),
                  label: Text
                  (
                    'Google',
                    style: TextStyle
                    (
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    side: const BorderSide
                    (
                      width: 1.0,
                      color: Colors.white,
                    )
                  ),
                ),
              ),
               SizedBox(
                height: 20,
              ),
              Container
              (
                width: 280,
                height: 45,
                child: ElevatedButton.icon
                (
                  icon: Image.asset("assets/addPerson.png"),
                  label: Text
                  (
                    'Create New Account',
                    style: TextStyle
                    (
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide
                    (
                      width: 2.0,
                      color: Colors.orange,
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
      ),
      
    );
  }
}