import 'package:flutter/material.dart';
import 'package:sih_version_1/pages/homePage.dart';



class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signIn();
}

TextEditingController username=new TextEditingController();
TextEditingController email=new TextEditingController();
TextEditingController password=new TextEditingController();
TextEditingController phone=new TextEditingController();

class _signIn extends State<signIn> {
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
                
                child: Text("Sign up",
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
                  controller: username,
                  decoration: InputDecoration(
                    label: Text("Name")
                    ,hintText:"Name",
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
                width:280 ,
                child: TextField(
                  controller: email,
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
                  controller: phone,
                   decoration: InputDecoration(
                    label: Text("Phone")
                    ,hintText:"Phone",
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
                  controller: password,
                   decoration: InputDecoration(
                    label: Text("Password")
                    ,hintText:"Password",
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color.fromARGB(246, 209, 212, 211)
                      )
                      ,borderRadius: BorderRadius.circular(8)
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
             , backgroundColor: Colors.green,
             foregroundColor: Colors.white
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
             Row(
              children: [
                SizedBox(width: 40,),
                  Text("By signing up you agree"),
             Text(" terms and condition" ,
             style: TextStyle(
              color: Colors.green
             ),)
              ],
             )
             
            ],
          ),
        ),
      )
    );
  }
}