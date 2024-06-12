import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names


class preview_page extends StatelessWidget {
   preview_page({Key? key, required this.picture,required this.Label}) : super(key: key);

  final XFile picture;
   String Label;
   

  @override
  Widget build(BuildContext context) {
      
     

      return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Center(
        child: 
        Column(
          mainAxisSize: MainAxisSize.min, 
          children: 
          [
            Container
            (
              width: 300,
              child: Image.file
              (
                File(picture.path), 
                fit: BoxFit.cover, 
                width: 250
              )
            ),

           SizedBox(height: 24),
          Text('Picture Name:'+picture.name),
          SizedBox(height: 24),
          Text(
            "Object Name:"+Label
            ),
        ]),
      ),
    );
  }
}