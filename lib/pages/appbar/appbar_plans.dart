import 'package:flutter/material.dart';

class AppBarPlans extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarPlansState createState() => _AppBarPlansState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarPlansState extends State<AppBarPlans> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Explore',
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      elevation: 1.0,
    );
  }
}
