import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'add_task.dart';
import 'description.dart';



class Home extends StatefulWidget {

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String uid='86a0yp80BrbHrmoWFYAejR0LtGb2';
  @override
  initState()
  {
    getuid();
    super.initState();
    print("HHHHHHHHHHH");
  }
  
  getuid()async
  {
    final auth = FirebaseAuth.instance;
    User? user = await auth.currentUser;
    setState(() 
    {
      uid =user!.uid; 
      //print(uid);
      // Fluttertoast.showToast(msg:uid);
    });
  }


  Widget build(BuildContext context) {
    
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('TODO'),
        actions: 
        [
          IconButton
          (
            onPressed:() async
            {
              await FirebaseAuth.instance.signOut();
            } , 
            icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder
        (
          stream:FirebaseFirestore.instance
          .collection('tasks')
          .doc(uid)
          .collection('mytasks')
          .snapshots(),
          builder:(context,snapshot)
          {
            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Container
              (
                 child: CircularProgressIndicator
                 (
                    strokeWidth: 5,
                    color: Colors.green, 
                 ),
              );
            }
            else
            { 
              final data_doc = snapshot.data!.docs;
              return ListView.builder
              (
                itemCount: data_doc.length,
                itemBuilder: ((context, index) 
                {
                  var time =(data_doc[index]['timestamp'] as Timestamp)
                                 .toDate();
                                  
                  return  InkWell
                  (
                    onTap: () 
                    {
                       // Fluttertoast.showToast(msg: 'click');
                       Navigator
                        .push
                        (
                          context, MaterialPageRoute
                          (
                            builder: (context)=> Description
                            (
                              title: data_doc[index]['title'],
                              description: data_doc[index]['description'],
                            )
                          )
                        );  
                    },
                    child: Container
                    (   
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration
                        (
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        height: 90,
                        
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column
                            (
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: 
                              [
                                Container
                                (
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text
                                  (
                                    data_doc[index]['title'],
                                    style: GoogleFonts.roboto(fontSize: 16),
                                  )
                                ),
                                SizedBox
                                (
                                  height: 5,
                                ),
                                Container
                                (
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text
                                  (
                                    DateFormat.yMd().add_jm().format(time)
                                  )
                                ),
                              
                              ]
                            ),
                            Container
                            (
                              child: IconButton
                              (
                                icon:Icon
                                (
                                  Icons.delete,
                                  size: 20,
                                  color: Colors.green,
                  
                                ),
                                onPressed: () async
                                {
                  
                                  await FirebaseFirestore.instance
                                          .collection('tasks')
                                          .doc(uid)
                                          .collection('mytasks')
                                          .doc(data_doc[index]['time'])
                                          .delete();
                                  Fluttertoast.showToast(msg:'Deleted');
                                } ,
                              ),  
                            )
                          ],
                        ) ,
                    ),
                  );
                })
              );
            }
          },
          
        ),
      ),
      floatingActionButton: FloatingActionButton
      (
        child: Icon(
          Icons.add,
          color: Colors.white,
          ),
        backgroundColor:Theme.of(context).primaryColor,
        onPressed: ()
        {
             Navigator.push
             (
              context, MaterialPageRoute
              (
                builder:(context)=>AddTask()
              )
            );
        },
        ),
    );
  }
}