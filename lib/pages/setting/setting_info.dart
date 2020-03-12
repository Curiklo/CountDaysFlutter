import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Information',
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isDark ? Colors.black87 : Colors.grey[300],
                ),
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.flight_takeoff),
              title: Text('Version'),
              subtitle: Text('0.0.3'),
            ),
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
              leading: Icon(Icons.phonelink),
              title: Text('Source'),
              subtitle: InkWell(
                onTap: launchURL,
                child: Text(
                  'Visit GitHub to see source & more infomation',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
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
              leading: Icon(Icons.loyalty),
              title: Text('MIT Lisence'),
              subtitle: Text('See source page and visit GitHub'),
            ),
          ),
        ],
      ),
    );
  }

  launchURL() async {
    const url = 'https://github.com/Hattomo/CountDaysFlutter';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
