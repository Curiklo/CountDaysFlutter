import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:CountDays(),
));

class CountDays extends StatefulWidget {
  @override
  _CountDaysState createState() => _CountDaysState();
}

class _CountDaysState extends State<CountDays> {

  var startDay = DateTime(2015,DateTime.october,1);
  var today = DateTime.now();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title:Text('Count Days'),
          centerTitle: true,
          backgroundColor: Colors.orange[300],
        ),
        body:TabBarView(
          // each tab content
          children: [
            Center(
            child: Text(
            '${today.difference(startDay).inDays}',
            style: TextStyle(
              fontSize: 50.0,
              letterSpacing: 2.0,
              color: Colors.grey,
                ),
              ),
            ),
            Icon(Icons.battery_std),
            Icon(Icons.loyalty),
            Icon(Icons.grade),
            Icon(Icons.android,color: Colors.green,size: 100.0,),
            Icon(Icons.store),
            Icon(Icons.widgets)
          ],
        ),
        /**/
        bottomNavigationBar: SafeArea(
          child: TabBar(
            // tab option
            isScrollable: true,
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
    );
  }
}
