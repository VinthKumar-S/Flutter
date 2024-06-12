
//import 'dart:js';

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_access/home.dart';
import 'package:camera_access/priview_pages.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';


class get_camera extends StatefulWidget {
   List<CameraDescription>? cameras;

   get_camera({Key? key,required this.cameras}):super(key: key);

  @override
  State<get_camera> createState() => _get_camera();
}

class _get_camera extends State<get_camera> {
  late CameraController _cameraController;

   List<dynamic> _output=[];
  @override

  Future initCamera(CameraDescription cameraDescription)async
  {
    _cameraController=CameraController(cameraDescription, ResolutionPreset.high);

    try{
        await _cameraController.initialize().then((_){
          if(!mounted) return;
          setState(() {
            
          });
        });
    }
    on CameraException catch(e)
    {
      debugPrint("camera error $e");
    }
  }

    void initState()
    {
      super.initState();
      initCamera(widget.cameras![0]);
      loadModel().then((value){
        setState(() {
          
        });
      });
    }

  void dispose()
  {
    _cameraController.dispose();
    super.dispose();
  }

  loadModel()async
  {
    await Tflite.loadModel(model: 'assets/model_unquant.tflite',labels: 'assets/labels.txt');
  }

  Future  detectImage(File image)async
  {
      print("Dectection Started");
      try
      { 
           var detected_Value = await Tflite.runModelOnImage
           (
            path: image.path,
            threshold: 0.6,
            imageMean: 127.5,
            imageStd: 127.5,
            numResults: 2
          );
        
      setState(() 
      {
        _output = detected_Value!;

        print(_output);
      });


      }
      on Tflite catch(e)
      {
          debugPrint("Tflite error $e");
      }
      on RangeError catch(e)
      {
        debugPrint("Range error $e");
      }
      catch(e)
      {
        debugPrint("catch error $e");
      }

  }

  Future takePicture()async{
    if(!_cameraController.value.isInitialized){return null;}
    if(_cameraController.value.isTakingPicture){return null;}

    try
    {
        await _cameraController.setFlashMode(FlashMode.off);
        
        XFile picture =await _cameraController.takePicture();
        print('Image Created');
          detectImage(File(picture.path));
        Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>preview_page(
          picture:picture,Label:_output.toString(),
        )));
    }
    on CameraException catch(e)
    {
        debugPrint('Error occured while taking picture: $e');
    return null;
    }
  }

  Widget build(BuildContext context) {
    
    return  Scaffold(

      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                width: 300,
                height: 500,
                child: _cameraController.value.isInitialized
                  ?CameraPreview(_cameraController)
                  :Center(
                    child: CircularProgressIndicator(),
                  ),
                  
              ),
              SizedBox(height: 5,)
              
              ,ElevatedButton(onPressed:takePicture, child:Text("Take a Picture")),
            ],
          ),
        ),
      ),
    );
  }
}