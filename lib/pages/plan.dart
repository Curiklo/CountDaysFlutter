import 'package:flutter/material.dart';
import 'package:CountDays/services/auth.dart';

class Plan extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton.icon(
        icon: Icon(Icons.person),
        label: Text('logout'),
        onPressed: () async {
          await _auth.signOut();
        },
      ),
    );
  }
}
