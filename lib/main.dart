import 'package:CountDays/pages/Footer.dart';
import 'package:CountDays/pages/days.dart';
import 'package:flutter/material.dart';
import 'package:CountDays/service/dateCalculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //grey color
  final lightBackgroundColor = const Color(0xFFEEF2F5);

  final DateCalculator dateCalculator = DateCalculator();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
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
                SizedBox(width: 40),
                Text(
                  '${dateCalculator.appbarDateFormatted}',
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
      ),
    );
  }
}
