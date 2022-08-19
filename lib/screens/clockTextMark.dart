import 'dart:math';

import 'package:flutter/material.dart';

class ClockTextMarker extends StatelessWidget {
  final int value, maxValue;
  final double radius;
  const ClockTextMarker(
      {required this.radius,
      required this.value,
      required this.maxValue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 30.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)..translate(pi - 2 * pi * (value / maxValue)),
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
