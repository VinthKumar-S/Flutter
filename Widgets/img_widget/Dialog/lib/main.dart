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
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void Dbox()
  {
    showModalBottomSheet<void>(context: context, builder:(BuildContext context){
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            TextButton(onPressed:(){
                Navigator.pop(context);

            }, child:Text('OK'),style: TextButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Colors.green),)
          ],
          
        ),
      );

    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Box'),

      ),
      body: Center(
        child: Column(
          children:<Widget> [
            TextButton(onPressed:(){
              Dbox();
            },
              child:Text('Click'),style:TextButton.styleFrom(foregroundColor: Colors.blueGrey,elevation: 2,backgroundColor: Colors.blue) ,)
          ],
        ),
      ),
    );
  }
}






