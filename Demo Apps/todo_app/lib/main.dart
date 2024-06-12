import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/screen/home.dart';
import 'auth/authscreen.dart';
import 'firebase_options.dart';
void main() async{
   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       brightness: Brightness.light,
       primarySwatch: Colors.green
      ),
     home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
       if(snapshot.hasData)
       {
        return Home();
       }
       else
       {
         return AuthScreen();
       }
     },),
    );
  }
}
