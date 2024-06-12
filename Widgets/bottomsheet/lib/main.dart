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
    
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 13, 217, 224)),
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
 List<String> friuts=['Orange','Apple','Mango','Banana'];

Map friuts_person={'friuts':['Orange','Apple','Mango','Banana']};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
       child: ElevatedButton(onPressed: (){
        showModalBottomSheet(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            isDismissible: false,
            enableDrag: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
            
            context: context, builder:(context){
            return Column(
              children: [
                ListTile(
                 onTap: (){
              
                },
                leading: Icon(Icons.person),
                title: Text("Orange"),
                subtitle: Text("Karan"),
                ),
                   ListTile(
                 onTap: (){
              
                },
                leading: Icon(Icons.person),
                title: Text("Orange"),
                subtitle: Text("Karan"),
                ),
                   ListTile(
                 onTap: (){
              
                },
                leading: Icon(Icons.person),
                title: Text("Orange"),
                subtitle: Text("Karan"),
                ),
                   ListTile(
                 onTap: (){
              
                },
                leading: Icon(Icons.person),
                title: Text("Orange"),
                subtitle: Text("Karan"),
                ),
                   ListTile(
                 onTap: (){
              
                },
                leading: Icon(Icons.person),
                title: Text("Orange"),
                subtitle: Text("Karan"),
                )
              ],
            );
          });
       }, child:Text("BottomSheet"),
       ),
      ),
    );
  }
}
