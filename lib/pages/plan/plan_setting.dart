import 'package:CountDays/models/plan.dart';
import 'package:CountDays/models/user.dart';
import 'package:CountDays/pages/loading.dart';
import 'package:CountDays/services/database.dart';
import 'package:CountDays/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  // form values
  String _currenticon;
  String _currenttitle;
  String _currentdetail;

  @override
  Widget build(BuildContext context) {
    Plan plan = Provider.of<Plan>(context);
    return StreamBuilder<PlanData>(
      stream: DatabaseService(titles: plan.uid).planData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          PlanData planData = snapshot.data;
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Edit   idea',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: planData.icon,
                    decoration:
                        textInputDecoration.copyWith(hintText: "Icon 🔥"),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a Icon' : null,
                    onChanged: (val) => setState(
                      () => _currenticon = val,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: planData.titles,
                    decoration:
                        textInputDecoration.copyWith(hintText: "Title 🚀"),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a title' : null,
                    onChanged: (val) => setState(() => _currenttitle = val),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 5,
                    initialValue: planData.detail,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a detail' : null,
                    onChanged: (val) => setState(() => _currentdetail = val),
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
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print(_currenticon);
                            print(_currenttitle);
                            print(_currentdetail);
                            await DatabaseService().updatePlanData(
                              plan.uid,
                              _currenttitle ?? snapshot.data.titles,
                              _currentdetail ?? snapshot.data.detail,
                              _currenticon ?? snapshot.data.icon,
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
