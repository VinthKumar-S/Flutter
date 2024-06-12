import 'package:bloc_app/secondPage.dart';
import 'package:bloc_app/service/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Widget build(BuildContext context) {

    final counterBloc=BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 243, 163),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Home"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>Second()));
          }, icon:Icon
            (
              Icons.arrow_circle_right
              ,color: Colors.black,
              
            )
          )
          ,SizedBox(width: 20,),
          IconButton(onPressed: (){
            counterBloc.add(IncreamentEvent());
          }, icon:Icon
            (
              Icons.add
              ,color: Colors.black,
              
            )
          )
          ,SizedBox(width: 20,),
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