import 'package:CountDays/models/plan_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:CountDays/models/planModel.dart';
import 'dart:io';

class PlanList extends StatefulWidget {
  @override
  _PlanListState createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  @override
  Widget build(BuildContext context) {
    final plans = Provider.of<List<PlanModel>>(context);
    print(plans.length);
    //To Do:need fix (Tried calling: forEach(Closure: (PlanModel) => Null))
    /*
    try{
      plans.forEach((plan) {
        print(plan.titles);
        print(plan.author);
        print(plan.details);
      });
    }catch(e){
      print(e);
    }
    */

    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return PlanTile(plan: plans[index]);
      },
    );
  }
}
