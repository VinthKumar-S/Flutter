import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authform extends StatefulWidget {

  @override
  State<Authform> createState() => _Authform();
}

class _Authform extends State<Authform> {

  //----------------------Variables-----------------------------------
  final _formKey = GlobalKey<FormState>();
  var _email='';
  var _password='';
  var _user='';
   bool isLoginPage= false;


//-------------------------Funcation------------------------------
  startauthentication() async
  {
    final validity = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if(validity)
    {
      _formKey.currentState!.save();
      submitform(_email,_password,_user);
    }
  }

  submitform(String email,String password,String username) async
  {
    final auth =FirebaseAuth.instance;
    UserCredential authResult;

    try{
      if(!isLoginPage)
      {
        authResult =await auth.signInWithEmailAndPassword(email: email, password: password);
      }
      else
      {
          authResult = await auth.createUserWithEmailAndPassword(email: email, password: password);
          String uid =authResult.user!.uid;
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            'username':username,
            'email':email
          });
      }
    }
    catch(err)
    {
        print(err);
    }
  }

  //----------------------Controllers--------------------------------------------
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final userController=TextEditingController();

  Widget build(BuildContext context) {
    
    return Container
    (
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(children: [
        Container
        (
          margin: EdgeInsets.all(8),
          height: 300,
          width: 300,
          child: Image.asset('assets/Checklist.jpg'),
        ),
        Container
        (
          padding: EdgeInsets.only(left: 10,right: 10,top: 10),
          child: Form
          (
            key: _formKey,
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                if(!isLoginPage) //if login page is true its not show the below text field,
                //other wise false it will show the below text field
                 TextFormField
                (
                  controller: userController,
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('username'),
                  validator: (value) 
                  {
                    if(value!.isEmpty )
                    {
                      return 'Invalid User';
                    }
                    return null;
                  },
                  onSaved:(value)
                  {
                    _user!=value;
                  },
                  decoration: InputDecoration
                  (
                    border: OutlineInputBorder
                    (
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide()
                    ),
                    label:Text('Username'),
                    labelStyle: GoogleFonts.roboto() 
                  ),
                ),
                SizedBox(height:10 ),

                TextFormField
                (
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('email'),
                  validator: (value) 
                  {
                    if(value!.isEmpty)
                    {
                      return 'Invalid';
                    }
                    return null;
                  },
                  onSaved:(value)
                  {
                    _email!=value;
                  },
                  decoration: InputDecoration
                  (
                    border: OutlineInputBorder
                    (
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide()
                    ),
                    label:Text('Email'),
                    labelStyle: GoogleFonts.roboto() 
                  ),
                ),
                  SizedBox(height:10 ),
                
                TextFormField
                (
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('password'),
                  validator: (value) 
                  {
                    if(value!.isEmpty)
                    {
                      return 'Incorrect password';
                    }
                    return null;
                  },
                  onSaved:(value)
                  {
                    _password!=value;
                  },
                  decoration: InputDecoration
                  (
                    border: OutlineInputBorder
                    (
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide()
                    ),
                    label:Text('Passowrd'),
                    labelStyle: GoogleFonts.roboto() 
                  ),
                ),
                SizedBox(height:10 ),
                Container
                (
                  padding: EdgeInsets.all(5),
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    child:isLoginPage
                    ?Text("Login",
                        style: GoogleFonts.roboto(fontSize: 16),)
                    :Text("SignUp",
                        style: GoogleFonts.roboto(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                          
                        ),
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white
                      ),
                    onPressed: () {
                        startauthentication();
                        _email=emailController.text;
                         _password=passwordController.text;
                          _user=userController.text;
                        print(_email+_user+_password);
                    },
                    ),
                ),
                Container(
                  child: TextButton
                  (
                    onPressed: () 
                    {
                      setState(() {
                        isLoginPage =!isLoginPage; //When the value is change that time 
                        //either user field's show or not
                      });
                    },
                    child: isLoginPage
                        ?Text('Not a member?')
                        :Text('Already a Member?'),
                  ),
                ) 
          ],
          )
          ),
        )
      ]),
    );
  }
}
  