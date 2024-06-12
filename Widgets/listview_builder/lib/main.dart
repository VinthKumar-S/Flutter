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
       child: ListView.builder(itemCount:friuts_person.length ,itemBuilder: ((context, index) {

        return Card(
        
             child:  ListTile(
                onTap: (){
              
                },
                leading: Icon(Icons.person),
                title: Text(friuts_person['friuts'][index]),
              ),
          
        );

       })),
       
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
}


