import 'package:flutter/material.dart';


class Forms extends StatefulWidget {

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
final _formKey =GlobalKey<FormState>();
String firstname='';
String lastname='';
String email='';
String password='';


Results()
{
    print(firstname);
      print(lastname);
      print(email);
      print(password);
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Forms"),
      ),
      body: Center(
        child: Form(
          
          key:_formKey, child: Column(
            
            children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Frist Name:',

            ),
            key: ValueKey('firstname'),
            validator: (value){
              if(value.toString().isEmpty){
                return 'Frist Name should not be Empty';
              }
              else{
                return null;
              }
            },
            onSaved: (value){
              firstname= value.toString();
            },
          ),
           TextFormField(
            decoration: InputDecoration(
              hintText: 'Last Name:',

            ),
            key: ValueKey('lastname'),
            validator: (value){
              if(value.toString().isEmpty){
                return 'Last Name should not be Empty';
              }
              else{
                return null;
              }
            },
            onSaved: (value){
              lastname= value.toString();
            },
          ),
           TextFormField(
            decoration: InputDecoration(
              hintText: 'Email:',

            ),
            key: ValueKey('email'),
            validator: (value){
              if(value.toString().isEmpty){
                return 'Email should not be Empty';
              }
              else{
                return null;
              }
            },
            onSaved: (value){
              email= value.toString();
            },
          ),
           TextFormField(
            decoration: InputDecoration(
              hintText: 'Password:',

            ),
            key: ValueKey('password'),
            validator: (value){
              if(value.toString().length <= 5){
                return 'length should be 6';
              }
              else{
                return null;
              }
            },
            onSaved: (value){
              password= value.toString();
            },
          ),
          TextButton(onPressed: (){
            Results();
          }, child:Text('Submit'))
    
          ],)),
      ),
    );
  }

}