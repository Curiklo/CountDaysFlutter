import 'package:flutter/material.dart';
import 'dart:async';
import 'package:CountDays/services/date_calculator.dart';

class AppBarDays extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarDaysState createState() => _AppBarDaysState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarDaysState extends State<AppBarDays> {
  Timer timer;
  String appbardisplaydays;
  DateCalculator datetimecalculator = DateCalculator();
  final lightBackgroundColor = const Color(0xFFEEF2F5);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(milliseconds: 300),
        (timer) => setState(() {
              appbardisplaydays = datetimecalculator.appbarDateFormatted;
            }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Count Days',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      actions: <Widget>[
        Center(
          child: Text(
            '$appbardisplaydays   ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
      backgroundColor: lightBackgroundColor,
      elevation: 1.0,
    );
  }
}
