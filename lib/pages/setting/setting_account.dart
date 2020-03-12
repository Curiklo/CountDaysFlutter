import 'package:CountDays/services/auth.dart';
import 'package:flutter/material.dart';

class SettingAccount extends StatefulWidget {
  @override
  _SettingAccountState createState() => _SettingAccountState();
}

class _SettingAccountState extends State<SettingAccount> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Container(
        child: FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Sign out'),
          onPressed: () async {
            await _auth.signOut();
          },
        ),
      ),
    );
  }
}
