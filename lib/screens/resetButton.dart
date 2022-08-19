import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ResetButton({this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.grey[900],
        child: InkWell(
          onTap: onPressed,
          child: const Align(
            alignment: Alignment.center,
            child: Text('Reset'),
          ),
        ),
      ),
    );
  }
}
