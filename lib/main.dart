import 'package:CountDays/pages/Footer.dart';
import 'package:CountDays/pages/days.dart';
import 'package:CountDays/pages/plan/plan_wrapper.dart';
import 'package:CountDays/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:CountDays/services/date_calculator.dart';
import 'package:CountDays/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:CountDays/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //grey color
  final lightBackgroundColor = const Color(0xFFEEF2F5);

  final DateCalculator dateCalculator = DateCalculator();
  var now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            backgroundColor: lightBackgroundColor,
            elevation: 1.0,
          ),
          body: TabBarView(
            // each tab content
            children: [
              //tab1
              Days(),
              StreamProvider<Person>.value(
                value: AuthService().user,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: PlanWrapper(),
                ),
              ),

              Center(
                child: Text('Now I am Building'),
              ),
              Setting(),
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
