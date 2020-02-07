import 'package:CountDays/models/plan.dart';
import 'package:CountDays/models/user.dart';
import 'package:CountDays/pages/loading.dart';
import 'package:CountDays/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanDetailSheet extends StatefulWidget {
  @override
  _PlanDetailSheetState createState() => _PlanDetailSheetState();
}

class _PlanDetailSheetState extends State<PlanDetailSheet> {
  @override
  Widget build(BuildContext context) {
    Plan plan = Provider.of<Plan>(context);
    return StreamBuilder<PlanData>(
      stream: DatabaseService(titles: plan.uid).planData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  '${plan.icon}',
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  '${plan.titles}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  '${plan.details}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
