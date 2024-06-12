//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'FB/DML.dart';
import 'firebase_options.dart';
import 'stateful.dart';
import 'FB/loginForm.dart';
import 'imagepicker.dart';
//import 'geolocator.dart';

void main() async {
// ...
  
 WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
/*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);*/
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    primarySwatch:Colors.purple
  ),
  home:getImage(),
      /*home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
      builder:(context, snapshot) 
      { 
        if(snapshot.hasData)
        {
          return dml();
        }
        else
        {
           return LoginForm();
        }
         },),*/
    );
  
  }
}

