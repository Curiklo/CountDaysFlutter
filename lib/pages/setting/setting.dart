import 'package:CountDays/pages/Setting/setting_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final darkbackgroundColor = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    var items = [
      SettingListViewData('info', Icons.info_outline, SettingInfo()),
    ];
    bool noti = true;
    bool isDark = Provider.of<bool>(context);
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
            title: Text('notification'),
            trailing: CupertinoSwitch(
              value: noti,
              onChanged: (bool newValue) {
                setState(() {
                  noti = newValue;
                });
              },
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
