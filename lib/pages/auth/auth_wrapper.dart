//This is wrapper to decide which pages (plan or authenticate) show

import 'package:CountDays/models/user.dart';
import 'package:CountDays/pages/auth/authenticate.dart';
import 'package:CountDays/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Person>(context);
    //print('user:$user');
    // return either the plan or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
