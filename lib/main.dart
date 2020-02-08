import 'package:CountDays/pages/appbar/appbar_feture.dart';
import 'package:CountDays/pages/appbar/appbar_plans.dart';
import 'package:CountDays/pages/appbar/appbar_setting.dart';
import 'package:CountDays/pages/appbar/appber_days.dart';
import 'package:CountDays/pages/days/days.dart';
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

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  //grey color
  final lightBackgroundColor = const Color(0xFFEEF2F5);

  final DateCalculator dateCalculator = DateCalculator();
  var now = DateTime.now();

  TabController tabController;
  final List<Widget> _tabs = [
    AppBarDays(),
    AppBarPlans(),
    AppBarFuture(),
    AppBarSettings(),
  ];
  Widget _myHandler;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 4);
    _myHandler = _tabs[0];
    tabController.addListener(_handleSelected);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[tabController.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(tabController.index);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: lightBackgroundColor,
          appBar: _tabs[tabController.index],

          body: TabBarView(
            controller: tabController,
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
            ],
          ),
          /**/
          //bottomNavigationBar: Footer(),
          bottomNavigationBar: SafeArea(
            child: Material(
              child: TabBar(
                controller: tabController,
                //isScrollable: true,
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                unselectedLabelStyle: TextStyle(fontSize: 12.0),
                labelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 16.0),
                indicatorColor: Colors.pink,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
