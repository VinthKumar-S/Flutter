import 'package:flutter/material.dart';

import 'Funcation/authentication.dart';

class LoginForm extends StatefulWidget {

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {

final _formKey =GlobalKey<FormState>();
bool isLogin = false;

var _userNameController = TextEditingController();
var _userEmailController = TextEditingController();
 var _userPasswordController = TextEditingController();

String username='',password='',email='';
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('FB Login'),
      ),
      body:Form(
        key: _formKey,
        child:Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


             !isLogin? TextFormField(
                controller: _userNameController,
                key: ValueKey('user'),
                decoration: InputDecoration(hintText: "UserName"),
                validator: (value){
                  if(value.toString().length<3)
                  {
                    return "Username is so small";
                  }
                  else
                  {
                    return null;
                  }
                },
                onSaved:(value){
                  setState(() {
                    username=_userNameController.text;
                    print(username);
                  });
                } ,
              ):Container(),
                //If user is Already logged then Container will display or otherwise TextField is display

                TextFormField(
                 controller: _userEmailController,
                key: ValueKey('email'),
                decoration: InputDecoration(hintText: "Email"),
                 validator: (value){
                  if(!(value.toString().contains('@')))
                  {
                    return "Invalid Email";
                  }
                  else
                  {
                    return null;
                  }
                },
                onSaved:(value){
                  setState(() {
                    email=_userEmailController.text;
                    print(email);
                  });
                } ,
              ),
               TextFormField(
                controller: _userPasswordController,
                obscureText: true,
                key: ValueKey('password'),
                decoration: InputDecoration(hintText: "Password"),
                 validator: (value){
                  if(value.toString().length<6)
                  {
                    return "Password is samall";
                  }
                  else
                  {
                    return null;
                  }
                },
                onSaved:(value){
                  setState(() {
                    password=_userPasswordController.text;
                    print(password);
                  });
                } ,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: (){
                 
                  username=_userNameController.text;   
                  email=_userEmailController.text;
                  password=_userPasswordController.text;
                    isLogin?signUp(email,password):signIn(email, password);

                    print(email+username+password);

                   _userNameController.text='';   
                  _userEmailController.text='';
                  _userPasswordController.text=''; 
                }, 
                 child:
                 isLogin ? Text("Login") : Text("SignUp")),

                  SizedBox(
                height: 10,
              ),
            TextButton(
              onPressed: (){
                setState(() {
                  isLogin =!isLogin;
                });
              }, 
              child: 
                isLogin?Text("Don't have an account")
                :Text("Already Singned"))
            ]),))
    );
  }
}
