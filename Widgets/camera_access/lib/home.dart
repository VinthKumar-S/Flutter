import 'package:camera/camera.dart';
import 'package:camera_access/get_camera.dart';
import 'package:flutter/material.dart';

class came_page extends StatefulWidget {
  const came_page({super.key});

  @override
  State<came_page> createState() => _came_page();
}

class _came_page extends State<came_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Row(
            children: [
               SizedBox(width: 40,),
              ElevatedButton(onPressed: () async{
                await availableCameras().then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (_)=>get_camera(cameras:value))));
              }, child:Text("Take a Picture")),
              SizedBox(width: 20,),
               ElevatedButton(onPressed: () async{
                
              }, child:Text("Select a Picture")),
            ],
          ),
          
      ),
    );
  }
}