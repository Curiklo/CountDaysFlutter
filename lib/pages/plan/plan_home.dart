import 'package:CountDays/models/plan.dart';
import 'package:CountDays/pages/plan/plan_add.dart';
import 'package:CountDays/services/database_plan.dart';
import 'package:CountDays/pages/plan/plan_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanHome extends StatefulWidget {
  @override
  _PlanHomeState createState() => _PlanHomeState();
}

class _PlanHomeState extends State<PlanHome> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);
    void _showCreatingPanel() {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: isDark ? Colors.grey[600] : Color(0xFFEEF2F5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: PlanAddForm(),
            ),
          );
        },
      );
    }

    return StreamProvider<List<Plan>>.value(
      value: DatabaseServicePlan().plans,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What\'s Next ? 🎃',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              PlanList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          //backgroundColor: Colors.pink,
          onPressed: () {
            _showCreatingPanel();
          },
        ),
      ),
    );
  }
}
