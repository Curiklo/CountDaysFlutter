import 'package:flutter/material.dart';
import 'dart:math' as math;

class Loading extends StatefulWidget {
  static const routeName = 'RotationTransition';

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        //color: Colors.pink[500],
        child: const Center(
          child: FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * 10.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
