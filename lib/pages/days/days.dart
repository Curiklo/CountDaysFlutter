import 'dart:async';
import 'dart:io';
import 'package:CountDays/pages/days/chart.dart';
import 'package:CountDays/services/date_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  final DateCalculator dateCalculator = DateCalculator();
  var startDay = DateTime(2015, DateTime.october, 1);
  final lightBackgroundColor = const Color(0xFFEEF2F5);
  DateTime today;
  Timer timer;
  int displayweeks;
  int displaydays;
  int displayyears;
  int displaymonth;

  /* because of web
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  */

  @override
  void initState() {
    super.initState();
    /*because of web
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
    */

    timer = Timer.periodic(
        Duration(milliseconds: 900),
        (timer) => setState(() {
              today = DateTime.now();
              displayweeks = (today.difference(startDay).inDays / 7).floor();
              displaydays = today.difference(startDay).inDays;
              displayyears = dateCalculator.dateYear(today);
              displaymonth = dateCalculator.dateMonth(today);
            }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('pyload'),
          content: Text('content'),
        ),
      );
    }
  }

  Future onDidReceiveLocationLocation(
      int id, String title, String body, String payload) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                child: Text(payload),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.white,
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
                                    color: Colors.black,
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
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(text: '  $displaydays'),
                                ],
                              ),
                            ),
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
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(text: 'Month🌕'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(text: '    $displaymonth'),
                                ],
                              ),
                            ),
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
                        onTap: () {}, //shownoti,(not web)
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                                      'Week🎯',
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
                                    child: Text(
                                      '$displayweeks',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 2.0,
                                        fontSize: 25.0,
                                      ),
                                    ),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
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
                                    'Year🌎',
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
                                  child: Text(
                                    '$displayyears',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2.0,
                                      fontSize: 25.0,
                                    ),
                                  ),
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
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
                child: Card(
                  elevation: 0.0,
                  child: ListTile(
                    title: Text(
                      '${(((displaydays ~/ 100) + 1) * 100) + index * 100}',
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                        '${dateCalculator.aniversaryDateCalculator((((displaydays ~/ 100) + 1) * 100) + index * 100)}'),
                  ),
                ),
              );
            },
          ),
        ),
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
