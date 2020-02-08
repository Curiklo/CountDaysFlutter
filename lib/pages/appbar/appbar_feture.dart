import 'package:flutter/material.dart';

class AppBarFuture extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarFutureState createState() => _AppBarFutureState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarFutureState extends State<AppBarFuture> {
  final lightBackgroundColor = const Color(0xFFEEF2F5);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Feture',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      backgroundColor: lightBackgroundColor,
      elevation: 1.0,
    );
  }
}
