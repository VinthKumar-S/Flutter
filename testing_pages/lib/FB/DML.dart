import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Funcation/database_funcation.dart';
import 'Pages/retrive.dart';
class dml extends StatefulWidget {

  @override
  State<dml> createState() => _dml();
}

class _dml extends State<dml> {

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Manipulation'),
        actions: [
          IconButton(
            onPressed:() async{
              await FirebaseAuth.instance.signOut();
            } , icon:Icon(Icons.leave_bags_at_home))
        ],
      ),
      body: Center(
       child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed:(){
             create('Pets','gattle', 'muto', 'bull', 5);
            }, child:Text("Create")),

             ElevatedButton(onPressed:(){
              update('Pets', 'kitty', 'age', 14);
             }, child:Text("Update")),

              ElevatedButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => retrive()));
              }, child:Text("Retrive")),

               ElevatedButton(onPressed:(){
                delete('Pets','kitty');
               }, child:Text("Delete")),

          ]),
       ),
      ),
    );
  }
}