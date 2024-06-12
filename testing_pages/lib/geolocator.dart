import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class geoloc extends StatefulWidget {

  @override
  State<geoloc> createState() => _geolocState();
}

class _geolocState extends State<geoloc> {
 Position? position;

 fetchposition() async{
  bool serviceEnabled;
  LocationPermission permission;
  String latitude;
  String longtitude;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();//->To get the state of location is enable or not

   if(!serviceEnabled){
    // Fluttertoast.showToast(msg: "Location Service is Enabled");
    print("Location Service is Enabled");
   }
   permission = await Geolocator.checkPermission();// to check permission is Enabled or Not
   if(permission == LocationPermission.denied)
   {
    // Fluttertoast.showToast(msg: "You Denied the Permission");
      print("You Denied the Permission");
   }
   Position currentposition = await Geolocator.getCurrentPosition();
   setState(() {
     position = currentposition;
      latitude = currentposition.latitude.toString();

      print(latitude);
   });
 }
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFul'),
      ),
      body: Center(
       child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Text(position == null ? 'Location' : position.toString(),style: TextStyle(fontSize: 20),),
        ElevatedButton(onPressed: (){
          fetchposition();
        }, child:Text('Get Location'))
       ],),

      ),
    );
  }
}
