import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  final VoidCallback? onPressed;
 final bool isRunning;
  const StartStopButton({this.onPressed,required this.isRunning,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.grey[900],
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(

              isRunning?  'Stop' : 'Start'),
          ),
        ),
      ),
    );
  }
}
