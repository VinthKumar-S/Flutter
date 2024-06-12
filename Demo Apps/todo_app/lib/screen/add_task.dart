import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTask();
}

class _AddTask extends State<AddTask> {
  @override
  final titleController =TextEditingController();
  final descrptionController =TextEditingController();

addtask_to_firebase() async 
{
  FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = await auth.currentUser;
  String uid = user!.uid;
  var time =DateTime.now();
  await FirebaseFirestore.instance
    .collection('tasks')
    .doc(uid)
    .collection('mytasks')
    .doc(time.toString())
    .set
    ({
        'title':titleController.text,
        'description':descrptionController.text,
        'time':time.toString(),
        'timestamp':time
    });
  Fluttertoast.showToast(msg: 'Data Added');
}


  Widget build(BuildContext context) {
    return  Scaffold
    (
      appBar: AppBar
      (
        title: Text('New Tasks'),
      ),
      body: Container
      (
        padding: EdgeInsets.all(10),
        child: Column
        (
          children:
          [
           Container
           (
            child: TextField
            (
              controller: titleController,
              decoration: InputDecoration
              (
                labelText:'Title',border: OutlineInputBorder()
              ),
            ),
           ),

           SizedBox(height: 10,),

            Container
           (
            child: TextField
            (
              controller: descrptionController,
              decoration: InputDecoration
              (
                labelText:'Description',border: OutlineInputBorder()
              ),
            ),
           ),
            Container
                (
                  padding: EdgeInsets.all(5),
                  width: 120,
                  height: 50,
                  child: ElevatedButton
                  (
                    child:Text
                    (
                      "Add Task",
                        style: GoogleFonts.roboto(fontSize: 16),
                     ),
                    
                
                    style: ButtonStyle
                    (
                      backgroundColor: MaterialStateProperty.resolveWith<Color>
                      (
                        (Set<MaterialState> state)
                        {
                          if(state.contains(MaterialState.pressed))
                          {
                            return Colors.yellow.shade100;
                          }
                          return Theme.of(context).primaryColor;   
                          
                        }
                      )
                    ),
                    onPressed: () 
                    {
                        addtask_to_firebase();
                    },
                    ),
                ),
          ],
        ),
      ),
    );
  }
}