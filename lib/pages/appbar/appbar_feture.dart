import 'package:flutter/material.dart';

class AppBarFuture extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarFutureState createState() => _AppBarFutureState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarFutureState extends State<AppBarFuture> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Feture',
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      elevation: 1.0,
    );
  }
}
