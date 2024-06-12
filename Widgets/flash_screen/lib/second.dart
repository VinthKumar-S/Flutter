import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second>with TickerProviderStateMixin {
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
          Lottie.network("https://assets2.lottiefiles.com/packages/lf20_YEy0IePrEz.json",controller: _controller)
        ],
      ),
    );
  }
}
