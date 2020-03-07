import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  static const routeName = 'RotationTransition';

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final lightBackgroundColor = const Color(0xFFEEF2F5);
  double iconsize = 50.0;

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
    bool isDark = Provider.of<bool>(context);
    return AnimatedBuilder(
      animation: _controller,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          color: isDark ? Colors.blueAccent[900] : lightBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Transform.rotate(
                    origin: Offset(0.0, 0.0),
                    angle: math.pi / -4,
                    child: Icon(
                      Icons.favorite,
                      color: const Color(0xFF4285F4),
                      size: iconsize,
                    ),
                  ),
                  Transform.rotate(
                    origin: Offset(0.0, 0.0),
                    angle: math.pi / -4 * 3,
                    child: Icon(
                      Icons.favorite,
                      color: const Color(0xFF0F9D58),
                      size: iconsize,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Transform.rotate(
                    origin: Offset(0.0, 0.0),
                    angle: math.pi / 4,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.orange,
                      size: iconsize,
                    ),
                  ),
                  Transform.rotate(
                    origin: Offset(0.0, 0.0),
                    angle: math.pi / 4 * 3,
                    child: Icon(
                      Icons.favorite,
                      color: const Color(0xFFDB4437),
                      size: iconsize,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * math.pi * 10,
          child: child,
        );
      },
    );
  }
}
