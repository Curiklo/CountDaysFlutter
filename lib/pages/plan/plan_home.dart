import 'package:CountDays/models/plan.dart';
import 'package:CountDays/pages/plan/plan_setting.dart';
import 'package:CountDays/services/database.dart';
import 'package:CountDays/services/plan_list.dart';
import 'package:flutter/material.dart';
import 'package:CountDays/services/auth.dart';
import 'package:provider/provider.dart';

class PlanHome extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Plan>>.value(
      value: DatabaseService().plans,
      child: Scaffold(
        backgroundColor: Color(0xFFEEF2F5),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
                child: Text(
                  'What are we gonna do ? 🎃',
                  style: TextStyle(
                    fontSize: 20.0,
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
          backgroundColor: Colors.pink,
          onPressed: () {
            DatabaseService().createPlanData('titles', 'details', 'author');
          },
        ),
      ),
    );
  }
}
