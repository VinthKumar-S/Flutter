import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class retrive extends StatefulWidget {

  @override
  State<retrive> createState() => _retrive();
}

class _retrive extends State<retrive> {

  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrive Data'),
      ),
      body: Container(
       margin: EdgeInsets.all(10),
       child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Pets').snapshots(),
       builder: (context,petSnapshot)
       {
          if(petSnapshot.connectionState==ConnectionState.waiting)
          {
            return Center(
              child:CircularProgressIndicator() );
          }
          else
          {
            final petDoc =petSnapshot.data!.docs;
            return ListView.builder(itemCount: petDoc.length,
              itemBuilder:((context, index) {
                return Card(
                  elevation: 10,
                  child: ListTile(
                    title: Text(petDoc[index]['name']),
                    subtitle: Text(petDoc[index]['animal']),
                  ),
                );
              })  );
          }
       },
       )
      ),
    );
  }
}