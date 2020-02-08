import 'package:CountDays/services/auth.dart';
import 'package:flutter/material.dart';

class AppBarPlans extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarPlansState createState() => _AppBarPlansState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarPlansState extends State<AppBarPlans> {
  final lightBackgroundColor = const Color(0xFFEEF2F5);
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Explore',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      backgroundColor: lightBackgroundColor,
      elevation: 1.0,
      actions: <Widget>[
        Container(
          child: FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign out'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ),
      ],
    );
  }
}
