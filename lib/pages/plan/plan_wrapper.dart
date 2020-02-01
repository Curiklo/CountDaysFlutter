//This is wrapper to decide which pages (plan or authenticate) show

import 'package:CountDays/models/user.dart';
import 'package:CountDays/pages/plan/authenticate.dart';
import 'package:CountDays/pages/plan/plan_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print('user:$user');
    // return either the plan or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return PlanHome();
    }
  }
}
