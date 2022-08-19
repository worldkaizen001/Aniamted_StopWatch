import 'dart:math';

import 'package:animated_stop_watch/screens/clockHand.dart';
import 'package:animated_stop_watch/screens/clockTextMark.dart';
import 'package:animated_stop_watch/screens/clocksSecondsTickerMaker.dart';
import 'package:flutter/material.dart';

import 'elaspedTimeBasicText.dart';

class StopWatchRenderer extends StatelessWidget {
  final Duration elapsed;
  final double radius;
  const StopWatchRenderer(
      {required this.elapsed, required this.radius, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(width: 3,color: Colors.orange),
        //     borderRadius: BorderRadius.circular(300)
        //   ),
        // ),
        for (var i = 0; i < 60; i++)
          Positioned(
              left: radius,
              right: radius,
              child: ClockSecondsTickMarker(
                seconds: i,
                radius: radius,
              )),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
              left: radius,
              right: radius,
              child: ClockTextMarker(radius: radius, value: i, maxValue: 60)),
        Positioned(
          left: radius,
          right: radius,
          child: ClockHand(
            color: Colors.orange,
            rotationZAngle: pi + ( 2 * pi / 60000) * elapsed.inMilliseconds,
            handThickness: 2,
            handLength: radius,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeTextBasic(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
