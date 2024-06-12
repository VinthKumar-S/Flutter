import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/service/counter.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    final counterBloc=BlocProvider.of<CounterBloc>(context);
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 243, 163),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Next"),
        actions: [
          IconButton(onPressed: (){
             Navigator.pop(context);
          }, icon:Icon
            (
              Icons.arrow_circle_left
              ,color: Colors.black,
              
            )
          )
          ,SizedBox(width: 20,),
          IconButton(onPressed: (){
             counterBloc.add(DecreamentEvent());
          }, icon:Icon
            (
              Icons.remove
              ,color: Colors.black,
              
            )
          )
          ,SizedBox(width: 20,)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            BlocBuilder<CounterBloc,int>(builder: (context,count){
              return Text(
                "Count:-${count}"
                ,style: TextStyle(fontSize: 30),
              );
            })
          ],
          
        ),
      ),
    );
  }
}