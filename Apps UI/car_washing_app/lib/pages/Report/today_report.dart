import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TodayReport extends StatefulWidget {
  const TodayReport({Key? key}) : super(key: key);

  @override
  _TodayReportState createState() => _TodayReportState();
}

class _TodayReportState extends State<TodayReport> {
  final controller = LiquidController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      LiquidSwipe(
        liquidController: controller,
        enableSideReveal: true,
        slideIconWidget: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPageChangeCallback: (index) {
          setState(() {});
        },
        pages: [
          Container(
              color: Color.fromRGBO(255, 160, 77, 1),
              child: Center(
                child: SizedBox(
                  width: 250.0,
                  child: TextLiquidFill(
                    text: 'HAVE A NICE DAY ',
                    waveColor: Colors.white,
                    boxBackgroundColor: Color.fromRGBO(255, 160, 77, 1),
                    textStyle: TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                    ),
                    boxHeight: 300.0,
                  ),
                ),
              )),
          Container(
            color: Colors.cyan,
            child: Column(
              children: [
                SizedBox(
                  height: 90.0,
                ),
                Center(
                    child: Text(
                  '28',
                  style: TextStyle(fontSize: 90.0, color: Colors.white),
                )),
                Center(
                    child: Text(
                  'Service Completed',
                  style: TextStyle(fontSize: 23.0, color: Colors.white),
                )),
                SizedBox(
                  height: 90.0,
                ),
                Center(
                    child: Text(
                  '10000',
                  style: TextStyle(fontSize: 70.0, color: Colors.white),
                )),
                Center(
                    child: Text(
                  'Today\'s Earning',
                  style: TextStyle(fontSize: 23.0, color: Colors.white),
                )),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 146, 225, 149),
            child: Center(
                child: Text(
              'Not Any Events',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ],
      ),
      Positioned(
        bottom: 0,
        left: 16,
        right: 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 4,
                effect: WormEffect(
                  activeDotColor: Colors.white,
                  spacing: 5,
                  dotColor: Colors.white54,
                ),
                onDotClicked: (index) {
                  controller.animateToPage(page: index);
                }),
            TextButton(
                onPressed: () {
                  final page = controller.currentPage + 1;

                  controller.animateToPage(
                      page: page > 4 ? 0 : page, duration: 400);
                },
                child: Text('NEXT',
                    style: TextStyle(
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    ]));
  }
}
