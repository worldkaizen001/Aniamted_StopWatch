import 'dart:async';
import 'package:animated_stop_watch/screens/resetButton.dart';
import 'package:animated_stop_watch/screens/startStopButton.dart';
import 'package:animated_stop_watch/screens/stopWatchRenderer.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';


import 'elaspedTimeBasicText.dart';

class StopWatchWidget extends StatefulWidget {
  const StopWatchWidget({Key? key}) : super(key: key);

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> with SingleTickerProviderStateMixin {

 Duration _previouslyElasped = Duration.zero;
 Duration _currentlyElasped = Duration.zero;

  Duration get _elapsed => _previouslyElasped + _currentlyElasped;
  late final Ticker _ticker;
  bool isRunning = false;

  @override
  void initState(){
    super.initState();
    _ticker = createTicker((elapsed) {
      setState((){
        _currentlyElasped  = elapsed;
      });
    });
   _ticker.start();
  }
  @override
  void dispose (){
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning (){
    setState((){
      isRunning = !isRunning;
      if(isRunning){
        _ticker.start();
      }else{
        _ticker.stop();
            _previouslyElasped += _currentlyElasped;
            _currentlyElasped =Duration.zero;
      }
    });
  }

  void _reset(){
    _ticker.stop();
    setState((){
      isRunning = false;
      _previouslyElasped = Duration.zero;
      _currentlyElasped = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraint){
      final radius = constraint.maxWidth / 2;
      return Stack(
        children: [
          StopWatchRenderer(
            elapsed: _elapsed,
            radius: radius,
          ),
           Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: 80,
              width: 80,
              child: ResetButton(
                onPressed: _reset,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 80,
              width: 80,
              child: StartStopButton(
                onPressed: _toggleRunning,
                  isRunning: isRunning
              ),
            ),
          ),
        ],
      );
    });
  }
}