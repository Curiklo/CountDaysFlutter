import 'package:CountDays/models/plan_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CountDays/models/plan.dart';

class PlanList extends StatefulWidget {
  @override
  _PlanListState createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  @override
  Widget build(BuildContext context) {
    final plans = Provider.of<List<Plan>>(context) ?? [];
    //print(plans.length);

    plans.forEach((plan) {
      //print(plan.titles);
      //print(plan.details);
    });

    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return PlanTile(plan: plans[index]);
      },
    );
  }
}
