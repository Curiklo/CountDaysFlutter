import 'package:CountDays/models/plan.dart';
import 'package:flutter/material.dart';

class PlanTile extends StatelessWidget {
  final Plan plan;
  PlanTile({this.plan});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[100],
          ),
          title: Text(plan.titles),
          subtitle: Text('Takes ${plan.details} ${plan.author} sugar(s)'),
        ),
      ),
    );
  }
}
