import 'package:CountDays/services/auth.dart';
import 'package:flutter/material.dart';

class AppBarPlans extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarPlansState createState() => _AppBarPlansState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarPlansState extends State<AppBarPlans> {
  final AuthService _auth = AuthService();
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
