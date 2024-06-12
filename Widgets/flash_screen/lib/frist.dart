import 'package:flash_screen/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class frist extends StatefulWidget {
  const frist({Key? key}) : super(key: key);

  @override
  State<frist> createState() => _fristState();
}

class _fristState extends State<frist>with TickerProviderStateMixin{
  @override
  late final AnimationController _controller;

  void iniState()
  {
    super.initState();
    _controller=AnimationController(vsync: this);
  }

  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.network("https://assets2.lottiefiles.com/packages/lf20_YEy0IePrEz.json",
              controller: _controller,
        /*  onLoaded: (compos){
            _controller
            ..duration=compos.duration
                ..forward().then((value){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>second())
                  );
                }*/
                ),

        ],
      ),
    );
  }
}


