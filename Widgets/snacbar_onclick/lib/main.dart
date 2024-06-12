import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()
        {
            // ignore: non_constant_identifier_names
            
            final snackBar =SnackBar
            (
              content:Text("Snackbar Display"),
              behavior: SnackBarBehavior.floating,
              duration: Duration(milliseconds: 3000),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
             action: SnackBarAction
             (
              label:"Undo", 
              textColor: Colors.blue,
              onPressed:()
              {

              }
              ),
              
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
