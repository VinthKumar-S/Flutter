import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
    List<String> fruits =['Orange','Apple','Mango','Grapes'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder:(context,index)
        {
          final friut = fruits[index];
          return Dismissible(
            onDismissed: (direction) {
              if(direction == DismissDirection.startToEnd)
              {
                  ScaffoldMessenger.of(context).showSnackBar
              (
                SnackBar(content:Text(fruits[index]),
                  backgroundColor: Colors.red,
                )
                );
              }
              else
              {
                  ScaffoldMessenger.of(context).showSnackBar
              (
                SnackBar(content:Text(fruits[index]),
                  backgroundColor: Colors.green,
                )
                );
              }
            },
            
            key: Key(friut),
            background: Container(
              color: Colors.red,
            ), 
            secondaryBackground: Container(
              color: Colors.green,
            ),
            child:Card(
              child: ListTile(
                title: Text(fruits[index]),
              ),
            )
            );
        } ,
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
