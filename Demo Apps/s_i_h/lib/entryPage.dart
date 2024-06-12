import 'package:flutter/material.dart';
import 'package:s_i_h/pages/loginPage.dart';
import 'package:s_i_h/pages/signinPage.dart';


class entryPage extends StatefulWidget {
  const entryPage({super.key});

  @override
  State<entryPage> createState() => _entryPage();
}

class _entryPage extends State<entryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          
          children: [
               SizedBox(
                height: 550,
               ),
            
              ConstrainedBox(constraints: BoxConstraints.tightFor(width: 280,height: 50),
             child:ElevatedButton(onPressed: () { 
                Navigator.push(context, MaterialPageRoute(builder: ((context) => loginPage())));
              },
             child: Text("Login",
             style: TextStyle(
              fontSize: 22
              ),
              ),
             style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(225, 254, 250, 224),
              foregroundColor: Color.fromARGB(255, 95, 111, 82),
              shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              
              side: BorderSide(color: Color.fromARGB(255, 95, 111, 82))
             ),
           
             ),
             ),
             ),
             SizedBox(
              height: 20,
             ),
            
             ConstrainedBox(constraints: BoxConstraints.tightFor(width: 280,height: 50),
             child:ElevatedButton(onPressed: () { 
                Navigator.push(context, MaterialPageRoute(builder: ((context) => signIn())));
              },
             child: Text("Signup",
             style: TextStyle(
              fontSize: 22,
              ),
              ),
             style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)
              
             )
             , backgroundColor: Color.fromARGB(255, 95, 111, 82),
              foregroundColor:  Color.fromARGB(225, 254, 250, 224),
             ),
             ),
             ),
            
          ],
        ),
      ),
    );
  }
}