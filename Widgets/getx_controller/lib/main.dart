import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: homePage(),
    );
  }
}
class Controller extends GetxController{
  RxInt num=10.obs;

  void add(){
    num =num+1;
  }
  
  void min(){
    num =num-1;
  }
}
class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: TextButton(onPressed: (){
          controller.add();
        }, child:Icon(
          Icons.add
          ,size: 40,
          )),
        actions: [
          TextButton(onPressed: (){
            controller.min();
          }, child: Icon(
            Icons.minimize_outlined
            ,size: 40,
          )
        )
        ],
      ),
      body: Obx(()=>
         Center(
          child: Text(
            controller.num.obs.value.string
            ,style: TextStyle(
              fontSize: 40,
              color: Colors.red
            ),
          ),
        ),
      ),
    );
  }
}