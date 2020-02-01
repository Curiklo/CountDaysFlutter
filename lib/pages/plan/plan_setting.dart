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
  String _currenttitle;
  String _currentdetail;
  String _currentauthor;

  @override
  Widget build(BuildContext context) {
    print("ww");
    User user = Provider.of<User>(context);
    print("w");
    return StreamBuilder<PlanData>(
      
        stream: DatabaseService(titles: user.uid).planData,
        builder: (context, snapshot) {
        // TODO: title is empty because user.uid doesnot eixt.
        if (snapshot.hasData) {
            PlanData planData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your todo settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currenttitle = val),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentdetail = val),
                  ),
                  /*
          DropdownButtonFormField(
            value: _currentSugars ?? '0',
            decoration: textInputDecoration,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
          
            onChanged: (val) => setState(() => _currentSugars = val ),
          ),
          */
                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: planData.author,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentauthor = val),
                  ),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        print(_currenttitle);
                        print(_currentdetail);
                        print(_currentauthor);
                        /*
              if(_formKey.currentState.validate()){
                      await DatabaseService(titles: user.uid).updatePlanData(
                        _currenttitle ?? snapshot.data.titles, 
                        _currentdetail ?? snapshot.data.detail, 
                        _currentauthor ?? snapshot.data.author
                      );
                      Navigator.pop(context);
                    }
                    */
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
