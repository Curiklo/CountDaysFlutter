import 'package:flutter/material.dart';

class AppBarSettings extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarSettingsState createState() => _AppBarSettingsState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarSettingsState extends State<AppBarSettings> {
  final lightBackgroundColor = const Color(0xFFEEF2F5);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Settings',
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
