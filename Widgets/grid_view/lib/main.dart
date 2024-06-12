import 'package:flutter/material.dart';
void main() {
  runApp( MyApp());
}
class MyApp  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {


 // This widget is the root of your application.
  List<String> friuts=['Orange','Apple','Mango','Banana'];

Map friuts_person={'friuts':['Orange','Apple','Mango','Banana']};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
     
        title: Text("ListView Builder"),
      ),
      body: Container(
      
        child: GridView.builder(itemCount: friuts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,

          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2,
              
          ),itemBuilder: (context, index) 
          {
              return Card(
                child: Center(
                  child: Text(friuts[index]),
                ),
              );
          },

        ),
       
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
}


