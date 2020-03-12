//This is wrapper to decide which pages (plan or authenticate) show
import 'package:CountDays/models/user.dart';
import 'package:CountDays/pages/auth/auth_wrapper.dart';
import 'package:CountDays/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthHome extends StatelessWidget {
  final Person person = Person();
  final lightBackgroundColor = const Color(0xFFEEF2F5);
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Provider<bool>.value(
      value: isDark,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: lightBackgroundColor,
          accentColor: Colors.pink,
          scaffoldBackgroundColor: lightBackgroundColor,
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.pink,
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
        home: Scaffold(
          body: StreamProvider<Person>.value(
            value: AuthService().user,
            child: Container(
              child: AuthWrapper(),
            ),
          ),
        ),
      ),
    );
  }
}
