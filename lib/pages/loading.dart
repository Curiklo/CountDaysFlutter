import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  static const routeName = 'RotationTransition';

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticIn,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: animation,
        child: Container(
          height: 80,
          width: 80,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
