import 'package:CountDays/pages/days.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: CountDays(),
    ));

class CountDays extends StatefulWidget {
  @override
  _CountDaysState createState() => _CountDaysState();
}

class _CountDaysState extends State<CountDays> {
  var startDay = DateTime(2015, DateTime.october, 1);
  var today = DateTime.now();
  final color = const Color(0xFFEEF2F5);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: color,
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
              SizedBox(width: 50),
              Text(
                '$today',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
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
            Icon(
              Icons.adb,
              color: Colors.green,
              size: 150.0,
            ),
            Icon(Icons.loyalty),
            Icon(Icons.grade),
            Icon(
              Icons.android,
              color: Colors.green,
              size: 150.0,
            ),
            Icon(Icons.store),
            Icon(Icons.widgets)
          ],
        ),
        /**/
        bottomNavigationBar: SafeArea(
          child: Material(
            child: TabBar(
              // tab option
              //isScrollable: true,
              unselectedLabelColor: Colors.black.withOpacity(0.3),
              unselectedLabelStyle: TextStyle(fontSize: 12.0),
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 16.0),
              indicatorColor: Colors.orange,
              indicatorWeight: 2.0,
              // content of tab
              tabs: [
                Tab(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.add,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.sentiment_very_satisfied,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.photo_album,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.explore,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.info,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.import_contacts,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
