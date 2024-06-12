import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_serialization/user_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.grey
      
      ),
      home: UserApp(),
    );
    
  }
}

class UserApp extends StatefulWidget {
  const UserApp({super.key});

  @override
  State<UserApp> createState() => _UserApp();
}

class _UserApp extends State<UserApp> {
  @override
  late User data;

   initState()
  {
    readLocalJson();
    print("ReadLocalJson is Active");
    super.initState();
  }

  readLocalJson() async
  {
    var d = await rootBundle.loadString("assets/json.json");
    data = userfromJson(d.toString());
    print(data.name);
  }

  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Json Serialization"),
      ),
      body: Column
      (
       
      ),
    );
  }
}