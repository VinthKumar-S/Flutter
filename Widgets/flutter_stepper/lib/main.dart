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
    
    );
  }
}

class Stepper extends StatefulWidget {
  const Stepper({super.key});

  @override
  State<Stepper> createState() => _StepperState();
}

class _StepperState extends State<Stepper> {
  int _currentStep = 0;

  List<Step> _steps =[
    Step(
      title: Text('Step 1'),
      content: Text("Content for Step 1"),
      isActive: true
    ),
    Step(
      title: Text('Step 2'),
      content: Text("Content for Step 2"),
      isActive: true
    ),
    Step(
      title: Text('Step 3'),
      content: Text("Content for Step 3"),
      isActive: true
    ),
    Step(
      title: Text('Step 4'),
      content: Text("Content for Step 1"),
      isActive: true
    ),
    Step(
      title: Text('Step 5'),
      content: Text("Content for Step 1"),
      isActive: true
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('E-Shape Stepper'),
        ),
        body:Center(
          child: Container(
            width: 300,
            child: Stepper(
               currentStep:_currentStep
            ),
          ),
        )
    );
  }
}