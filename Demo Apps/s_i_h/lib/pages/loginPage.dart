import 'package:flutter/material.dart';
import 'package:s_i_h/pages/homePage.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPage();
}

class _loginPage extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                
                child: Text("Login",
                style: TextStyle(
                  fontSize: 30
                  
                ),),
                ),
                SizedBox(
                height: 60,
              ),
              Container(
                width:280 ,
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("Email")
                    ,hintText:"Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color.fromARGB(246, 209, 212, 211)
                      ),
                      borderRadius: BorderRadius.circular(8)
                     )
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 280,
                child: TextField(
                   decoration: InputDecoration(
                    label: Text("Password")
                    ,hintText:"Password",
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color.fromARGB(246, 209, 212, 211)
                      ),
                      borderRadius: BorderRadius.circular(8)
                     )
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
             ConstrainedBox(constraints: BoxConstraints.tightFor(width: 280,height: 50),
             child:ElevatedButton(onPressed: () {  
               Navigator.push(context, MaterialPageRoute(builder: ((context) => homePage())));
             },
             child: Text("Log In",
             style: TextStyle(
              fontSize: 22
              ),
              ),
             style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)
             )
             ,backgroundColor: Color.fromARGB(255, 95, 111, 82),
             foregroundColor: Color.fromARGB(225, 254, 250, 224)
             ),
             ),
             ),
             SizedBox(
              height: 40,
             ),
             Container(
      
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                ),
                IconButton(onPressed: (){}, icon:new Image.asset('assets/g.png')),
                IconButton(onPressed: (){}, icon:new Image.asset('assets/f.png')),
                IconButton(onPressed: (){}, icon:new Image.asset('assets/apple.png',width: 22,))
              ],
             )
           ,
             ),
             SizedBox(
              height: 20,
             ),
             TextButton(onPressed: (){}, child:Text(
              "Forgot Password",
              style: TextStyle(
                color: Color.fromARGB(255, 95, 111, 82)
              ),
              ))
            ],
          ),
        ),
      )
    );
  }
}