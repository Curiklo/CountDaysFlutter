import 'package:CountDays/pages/plan/signIn.dart';
import 'package:flutter/material.dart';
import 'package:CountDays/pages/plan/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //flag showing whether signing in or not
  bool showSignIn = true;

  //change show signSignIn flag
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    print("Authenticate");
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
