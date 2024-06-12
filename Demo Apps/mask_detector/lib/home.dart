
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late bool _loading = true;
  XFile? _image;
  final imagepicker= ImagePicker(); 
  List _predictions=[];

  void initState()
  {
    super.initState();
     loadmodal();

  }

  loadmodal() async
  {
    await Tflite.loadModel
    (
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt'
    );
    print('Model loaded');
  }

  detect_image(XFile image)async
  {
    var  prediction = await  Tflite.runModelOnImage
    (
      path: image.path,
      numResults: 2,//To give two type of result(mask/unmask)
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5
    );

    setState(() {
      _loading = false;
      _predictions = prediction!;
    });
  }

  _loadimage_gallery()async
  {
    var image = await imagepicker.pickImage(source: ImageSource.gallery);

    if(image == null)
    {
      return null;
    }
    else
    {
      /* setState(() {
        _loading=false;
      });*/
      _image = XFile(image.path);
    }
  detect_image(_image!);
  }

   _loadimage_camera()async
  {
    var image = await imagepicker.pickImage(source: ImageSource.camera);

    if(image == null)
    {
      return null;
    }
    else
    {
      /*setState(() {
        _loading=false;
      });*/
      _image = XFile(image.path);
    }
    detect_image(_image!);
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold
    (
      appBar: AppBar
      (
       
        title: Text
        (
          'ML Classifier',
          style:GoogleFonts.roboto(),
        ),
      ),
      body: Container
      (
        height: h,
        width: w,
       // color: Colors.blue,
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Container
            (
              height: 150,
              width: 150,
              
              //color: Colors.green,
              child: Image.asset('assets/mask.png'),
            ),
          
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                SizedBox(height: 10),
                Container
                (
                  width: 150,
                  height: 50,
                  child: ElevatedButton
                  (
                    child:Text
                    (
                      'Camera',
                      style: GoogleFonts.roboto
                      (
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: ()
                    {
                      _loadimage_camera();
                    }, 
                    style:ButtonStyle
                    (
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>
                      (
                        RoundedRectangleBorder
                        (
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                         
                    ),
                
                  ),
                  
                ),
                 SizedBox(width: 10),
                Container
                (
                  width: 150,
                  height: 50,
                  child: ElevatedButton
                  (
                    child:Text
                    (
                      'Gallery',
                      style: GoogleFonts.roboto
                      (
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: ()
                    {
                      _loadimage_gallery();
                    }, 
                    style:ButtonStyle
                    (
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>
                      (
                        RoundedRectangleBorder
                        (
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                         
                    ),
                
                  ),
                  
                ),
              ],
            ),
             SizedBox(height: 10),
            _loading == false
              ?Container
              (
                child: Column
                (
                  children: [
                    Container
                    (
                      height: 200,
                      width: 200,
                      child: Image.file(File(_image!.path)),
                    ),
                    Text
                    (
                      _predictions[0]['label'].toString().substring(2)
                    ),
                     Text
                    (
                      'Confidence:'+_predictions[0]['confidence'].toString().substring(2)
                    )
                  ],
                ),
              )
              :Container()
          ]
        ),
      ),
    );
  }
}