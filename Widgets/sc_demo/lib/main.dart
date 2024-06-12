import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

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
  final scratchkey =GlobalKey<ScratcherState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Scratcher(
              key: scratchkey,
              brushSize: 30,
              threshold: 50,

              color:Colors.blue,
               child: Container(
                 width: 150,
                 height: 150,
                   child: Image(image:AssetImage('sc/img.png')),

               ),
            ),
            ElevatedButton(onPressed:(){
              scratchkey.currentState?.reset(duration: Duration(milliseconds: 100));
            }, child: Text('Reset'))
          ],
        ),
      ),
    );
  }
}






