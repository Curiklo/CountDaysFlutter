import 'package:CountDays/pages/days/chart.dart';
import 'package:CountDays/pages/days/day_text.dart';
import 'package:CountDays/pages/days/day_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  final lightBackgroundColor = const Color(0xFFEEF2F5);
  final darkbackgroundColor = Colors.grey[800];

  /* because of web
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    
    if (Platform.isIOS ||
        Platform.isAndroid ||
        Platform.isMacOS ||
        Platform.isFuchsia) {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
      var initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      var initializationSettingsIOS = IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocationLocation);
      var initializationSettings = InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOS);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: onSelectNotification);
    }
    
  }

  
  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
      Navigator.pushReplacementNamed(context, '/plans');
    }
  }

  Future onDidReceiveLocationLocation(
      int id, String title, String body, String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
      Navigator.pushReplacementNamed(context, '/plans');
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    //print('${MediaQuery.of(context).platformBrightness}');
    bool isDark = Provider.of<bool>(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 15.0),
                child: Text(
                  'Our Current Day🎊',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                child: Container(
                  height: 200,
                  width: 800,
                  decoration: BoxDecoration(
                    color: isDark ? darkbackgroundColor : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    //letterSpacing: 2.0,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                  children: [
                                    TextSpan(text: 'Days🌅'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DayText(),
                            SizedBox(
                              height: 20.0,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    //letterSpacing: 2.0,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                  children: [
                                    TextSpan(text: 'Months🌕'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MonthText(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: DaysChart(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 10.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 3.0, 5.0),
                      child: InkWell(
                        onTap: () {}, //shownoti, //(not web)
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDark ? darkbackgroundColor : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                25.0, 10.0, 10.0, 15.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                      'Weeks🎯',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: WeekText(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 3.0, 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark ? darkbackgroundColor : Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 15.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Text(
                                    'Years🌎',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: YearText(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 25.0, 0.0, 5.0),
                child: Text(
                  'Next anniversary🎉',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        DayTile(),
      ],
    );
  }

/* because of web
  Future shownoti() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }
  */
}
