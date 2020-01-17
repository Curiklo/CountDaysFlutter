import 'package:CountDays/pages/Footer.dart';
import 'package:CountDays/pages/days.dart';
import 'package:flutter/material.dart';
import 'package:CountDays/service/dateCalculator.dart';

void main() => runApp(MaterialApp(
      home: CountDays(),
    ));

class CountDays extends StatefulWidget {
  @override
  _CountDaysState createState() => _CountDaysState();
}

class _CountDaysState extends State<CountDays> {
  //days for calculation
  var startDay = DateTime(2015, DateTime.october, 1);
  var today = DateTime.now();

  //grey color
  final lightBackgroundColor = const Color(0xFFEEF2F5);

  final DateCalculator dateCalculator= DateCalculator();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: lightBackgroundColor,
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Text(
                'Count Days',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(width: 60),
              Text(
                '${dateCalculator.sentDateFormatted}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          //centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: TabBarView(
          // each tab content
          children: [
            //tab1
            Days(),
            Center(
              child: Text('Now I am Building'),
            ),
            Center(
              child: Text('Now I am Building'),
            ),
            Center(
              child: Text('Now I am Building'),
            ),
            Center(
              child: Text('This will come in the future'),
            ),

          ],
        ),
        /**/
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
