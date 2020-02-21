import 'dart:async';

import 'package:CountDays/services/date_calculator.dart';
import 'package:flutter/material.dart';

class DayText extends StatefulWidget {
  @override
  _DayTextState createState() => _DayTextState();
}

class _DayTextState extends State<DayText> {
  Timer timer;
  DateTime today;
  int displaydays = 2015;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
        Duration(milliseconds: 900),
        (timer) => setState(() {
              today = DateTime.now();
              displaydays = today.difference(DateTime(2015, 10, 1)).inDays;
            }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}

class WeekText extends StatefulWidget {
  @override
  _WeekTextState createState() => _WeekTextState();
}

class _WeekTextState extends State<WeekText> {
  Timer timer;
  DateTime today;
  DateTime startday = DateTime(2015, 10, 1);
  int displayweeks = 7;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
        Duration(milliseconds: 900),
        (timer) => setState(() {
              today = DateTime.now();
              displayweeks = (today.difference(startday).inDays / 7).floor();
            }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$displayweeks',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 2.0,
        fontSize: 25.0,
      ),
    );
  }
}

class MonthText extends StatefulWidget {
  @override
  _MonthTextState createState() => _MonthTextState();
}

class _MonthTextState extends State<MonthText> {
  Timer timer;
  DateTime today;
  DateCalculator datecalculator = DateCalculator();
  int displaymonths = 1001;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
        Duration(milliseconds: 900),
        (timer) => setState(() {
              today = DateTime.now();
              displaymonths = datecalculator.dateMonth(today);
            }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 2.0,
          color: Colors.black,
        ),
        children: [
          TextSpan(text: ' $displaymonths'),
        ],
      ),
    );
  }
}

class YearText extends StatefulWidget {
  @override
  _YearTextState createState() => _YearTextState();
}

class _YearTextState extends State<YearText> {
  Timer timer;
  DateTime today;
  DateCalculator datecalculator = DateCalculator();
  int displayyears = 7;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
        Duration(milliseconds: 900),
        (timer) => setState(() {
              today = DateTime.now();
              displayyears = datecalculator.dateYear(today);
            }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$displayyears',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 2.0,
        fontSize: 25.0,
      ),
    );
  }
}
