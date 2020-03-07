import 'package:flutter/material.dart';

class AppBarSettings extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarSettingsState createState() => _AppBarSettingsState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarSettingsState extends State<AppBarSettings> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Settings',
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      elevation: 1.0,
    );
  }
}
