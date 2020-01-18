import 'package:CountDays/models/planModel.dart';
import 'package:CountDays/services/database.dart';
import 'package:CountDays/services/planList.dart';
import 'package:flutter/material.dart';
import 'package:CountDays/services/auth.dart';
import 'package:provider/provider.dart';

class Plan extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PlanModel>>.value(
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
          PlanList(),
        ],
      ),
    );
  }
}
