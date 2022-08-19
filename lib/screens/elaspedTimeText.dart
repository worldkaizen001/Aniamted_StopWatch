import 'package:flutter/material.dart';

class ElapsedTimeText extends StatelessWidget {
  const ElapsedTimeText({required this.elapsed,Key? key}) : super(key: key);

  final Duration elapsed;

  @override
  Widget build(BuildContext context) {
    final hundreds = (elapsed.inMilliseconds / 10) % 100;
    final seconds = elapsed.inSeconds % 60;
    final minutes = elapsed.inMinutes % 60;
    final hundredsStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    const digitWidth = 12.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeDigit(text: minutesStr.substring(0, 1), width: digitWidth),
        TimeDigit(text:minutesStr.substring(0, 2),width: digitWidth),
        const TimeDigit(text:':', width: 6),
        TimeDigit(text:secondsStr.substring(0, 1),width: digitWidth),
        TimeDigit(text:secondsStr.substring(1, 2),width: digitWidth),
        const TimeDigit(text:'.', width: 6),
        TimeDigit(text:hundredsStr.substring(0, 1), width: digitWidth),
        TimeDigit(text:hundredsStr.substring(1, 2), width: digitWidth),

      ],
    );
  }
}

class TimeDigit extends StatelessWidget {
  const TimeDigit({required this.text, required this.width, Key? key}) : super(key: key);
  final String text;
  final  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(text,style: const TextStyle(
          fontSize: 20
      ),textAlign: TextAlign.center,),
    );
  }
}
