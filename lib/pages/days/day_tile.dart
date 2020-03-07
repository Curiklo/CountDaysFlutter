import 'dart:async';

import 'package:CountDays/services/date_calculator.dart';
import 'package:flutter/material.dart';

class DayTile extends StatefulWidget {
  @override
  _DayTileState createState() => _DayTileState();
}

class _DayTileState extends State<DayTile> {
  Timer timer;
  DateTime today;
  int displaydays = 2015;
  int olddisplaydays = 0;
  DateCalculator datecalculator = DateCalculator();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 900), (timer) {
      today = DateTime.now();
      displaydays = today.difference(DateTime(2015, 10, 1)).inDays;
      if (displaydays != olddisplaydays) {
        setState(() {
          today = DateTime.now();
          displaydays = today.difference(DateTime(2015, 10, 1)).inDays;
        });
      }
      olddisplaydays = displaydays;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
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
                  ),
                ),
                subtitle: Text(
                    '${datecalculator.aniversaryDateCalculator((((displaydays ~/ 100) + 1) * 100) + index * 100)}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
