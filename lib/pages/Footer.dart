import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
