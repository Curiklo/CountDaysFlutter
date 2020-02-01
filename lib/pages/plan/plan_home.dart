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

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Plan>>.value(
      value: DatabaseService().plans,
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
          Container(
            child: FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await DatabaseService(titles: 'titles')
                    .updatePlanData('0', 'new crew member', 'name');
              },
            ),
          ),
          FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            ),
          PlanList(),
        ],
      ),
    );
  }
}
