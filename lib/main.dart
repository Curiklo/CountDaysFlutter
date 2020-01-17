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
  final color = const Color(0xFFEEF2F5);
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
              SizedBox(width: 60),
              Text(
                '${dateCalculator.sentDateFormatted}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
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
              child: Text('Now I am Building'),
            ),

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
                    Icons.explore,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.photo_album,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.settings,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.textsms,
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
