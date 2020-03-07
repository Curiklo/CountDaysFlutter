import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  final darkbackgroundColor = Colors.grey[800];
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                child: Container(
                  height: 200,
                  width: 600,
                  decoration: BoxDecoration(
                    color: isDark ? darkbackgroundColor : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2.0,
                                      color:
                                          isDark ? Colors.white : Colors.black,
                                    ),
                                    children: [
                                      TextSpan(text: 'version'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.0,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            children: [
                              TextSpan(text: '0.0.1'),
                            ],
                          ),
                        ),
                      ],
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
                    color: isDark ? darkbackgroundColor : Colors.white,
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
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            children: [
                              TextSpan(text: 'Lisence'),
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
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            children: [
                              TextSpan(text: 'MIT'),
                            ],
                          ),
                        ),
                      ],
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
                    color: isDark ? darkbackgroundColor : Colors.white,
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
                              color: isDark ? Colors.white : Colors.black,
                            ),
                            children: [
                              TextSpan(text: 'Source Code'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        InkWell(
                          onTap: _launchURL,
                          child: Text(
                            'Visit Github',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _launchURL() async {
    const url = 'https://github.com/Hattomo/CountDaysFlutter';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
