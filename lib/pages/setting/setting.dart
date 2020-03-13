import 'package:CountDays/models/user.dart';
import 'package:CountDays/pages/setting/setting_info.dart';
import 'package:CountDays/pages/setting/setting_account.dart';
import 'package:CountDays/services/database_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final darkbackgroundColor = Colors.grey[800];
  final DatabaseServiceUser databaseServiceUser = DatabaseServiceUser();
  @override
  Widget build(BuildContext context) {
    var items = [
      SettingListViewData('Info', Icons.info_outline, SettingInfo()),
      SettingListViewData('Account', Icons.supervisor_account, SettingAccount())
    ];

    bool isDark = Provider.of<bool>(context);
    Person person = Provider.of<Person>(context);
    print(person.uid);
    print(person.feature);
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? Colors.black87 : Colors.grey[300],
                  ),
                ),
              ),
              child: ListTile(
                title: Text(items[index].title),
                leading: Icon(items[index].leading),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => items[index].route,
                    ),
                  );
                },
              ),
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isDark ? Colors.black87 : Colors.grey[300],
              ),
            ),
          ),
          child: ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Notification'),
            subtitle: Text('Experiment Status'),
            trailing: CupertinoSwitch(
              value: person.feature[0],
              onChanged: null,
              activeColor: Colors.pink,
            ),
          ),
        ),
      ],
    );
  }
}

class SettingListViewData {
  String title;
  IconData leading;
  Widget route;
  SettingListViewData(this.title, this.leading, this.route);
}
