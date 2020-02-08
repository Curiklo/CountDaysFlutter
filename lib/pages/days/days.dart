import 'dart:async';
import 'package:CountDays/services/date_calculator.dart';
import 'package:flutter/material.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  final DateCalculator dateCalculator = DateCalculator();
  var startDay = DateTime(2015, DateTime.october, 1);
  DateTime today;
  Timer timer;
  int displayweeks;
  int displaydays;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(milliseconds: 300),
        (timer) => setState(() {
              today = DateTime.now();
              displayweeks = (today.difference(startDay).inDays / 7).floor();
              displaydays = today.difference(startDay).inDays;
            }));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate([
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
            child: Card(
              child: Center(
                child: Text(
                  'Week\n$displayweeks',
                  style: TextStyle(
                    fontSize: 50.0,
                    letterSpacing: 2.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
            child: Container(
              height: 200,
              width: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/back.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                child: Text(
                  "Days",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
            child: Container(
              height: 200,
              width: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: 'Days'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
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
                          TextSpan(text: '$displaydays'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 15.0),
            child: Text(
              'Next anniversary🎉',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          )
        ]),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Card(
                elevation: 0.0,
                child: Center(
                  child: Text(
                    '${dateCalculator.aniversaryDateCalculator(1600 + index * 100)}',
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.lightBlue[100 * (index % 9)],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
