import 'package:flutter/material.dart';
import 'package:enhance_stepper/enhance_stepper.dart';

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
      ),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
          title: Text("E Shape Stepper"),
        ),
        body: EStepper(),
      ),
    );
  }
}

class EStepper extends StatefulWidget {
  const EStepper({super.key});

  @override
  State<EStepper> createState() => _EStepperState();
}

class _EStepperState extends State<EStepper> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return EnhanceStepper(
      currentStep: _currentStep,
      onStepTapped: (step) =>setState(() {
        _currentStep = step;        
      }) ,
      steps: [
        EnhanceStep(
          title: Text('Step 1'), 
          content: Text('Content for Step 1')
        ),
        EnhanceStep(
          title: Text('Step 2'), 
          content: Text('Content for Step 1')
        ),
        EnhanceStep(
          title: Text('Step 3'), 
          content: Text('Content for Step 1')
        ),
        EnhanceStep(
          title: Text('Step 4'), 
          content: Text('Content for Step 1')
        ),
      ],
      controlsBuilder: (context, details) {
        return Row(
          children: <Widget>[
            TextButton(
              onPressed: details.onStepCancel, 
              child:Text('Back'),
            ),
            SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: details.onStepContinue, 
              child: Text("Next"),
            )
          ],
        );
      },
    );
  }
}

stf