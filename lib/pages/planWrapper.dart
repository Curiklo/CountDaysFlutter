//This is wrapper to decide which pages (plan or authenticate) show

import 'package:CountDays/models/user.dart';
import 'package:CountDays/pages/authenticate.dart';
import 'package:CountDays/pages/plan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return either the plan or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Plan();
    }
  }
}
