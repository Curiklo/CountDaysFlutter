import 'package:CountDays/models/plan.dart';
import 'package:CountDays/pages/plan/plan_detail.dart';
import 'package:CountDays/pages/plan/plan_setting.dart';
import 'package:CountDays/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanTile extends StatelessWidget {
  final Plan plan;
  PlanTile({this.plan});

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(Plan plan) {
      showDialog(
        context: context,
        builder: (context) {
          return Provider<Plan>.value(
            value: plan,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              backgroundColor: const Color(0xFFEEF2F5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: SettingsForm(),
              ),
            ),
          );
        },
      );
    }

    void _showDetailPanel(Plan plan) {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0)),
            ),
            child: Provider<Plan>.value(
              value: plan,
              child: Container(
                //width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: PlanDetailSheet(),
              ),
            ),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 6.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.brown[100],
              ),
              title: Text(plan.titles),
              subtitle: Text('\n${plan.details}'),
              trailing: Icon(
                Icons.favorite,
                size: 30.0,
                color: Colors.pink[200],
              ),
              onLongPress: () {
                _showSettingsPanel(plan);
              },
              onTap: () {
                _showDetailPanel(plan);
              },
            ),
            ButtonBar(
              children: <Widget>[
                SizedBox(
                  height: 35.0,
                  child: FlatButton(
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _showSettingsPanel(plan);
                      },
                    ),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 35.0,
                  child: FlatButton(
                    child: IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        DatabaseService().deletePlanData(plan);
                      },
                    ),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
