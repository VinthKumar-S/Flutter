import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class getImage extends StatefulWidget {

  @override
  State<getImage> createState() => _getImageState();
}

class _getImageState extends State<getImage> {
XFile? file;
ImagePicker _picker =ImagePicker();
List<XFile>? files;
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFul'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              height: 300,
              width: double.infinity ,
              color: Colors.grey.shade200,
              child: Center(child:file == null? 
              Text("Image not Picked"):
              Image.file(
                File(file!.path),
                fit: BoxFit.cover,
                )),
            ),
            ElevatedButton(onPressed: () async{
              final XFile? photo = await _picker.pickImage(source:ImageSource.gallery);
              setState(() {
                file = photo;
              });
              print("Image Picked");
              print(photo!.path);
            }, child:Text('Pick Image')),
              ElevatedButton(onPressed: () async{
              final List<XFile>? photos = await _picker.pickMultiImage();
              setState(() {
                files = photos;
              });
              print("Image Picked");
              for(int i=0;i<files!.length;i++)
              {
                print(files![i].path);
              }
            }, child:Text('Pick Images'))
          ]
        ),
       
      ),
    );
  }
}
