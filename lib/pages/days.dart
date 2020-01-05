import 'package:flutter/material.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  var startDay = DateTime(2015, DateTime.october, 1);
  var today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
            child: Card(
              child: Center(
                child: Text(
                  'Week\n${(today.difference(startDay).inDays / 7).floor()} ',
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
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/back.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
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
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'Days\n${today.difference(startDay).inDays}')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
