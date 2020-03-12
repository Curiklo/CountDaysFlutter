import 'package:CountDays/models/user.dart';
import 'package:CountDays/pages/appbar/appber_days.dart';
import 'package:CountDays/services/auth.dart';
import 'package:CountDays/services/database_user.dart';
import 'package:flutter/material.dart';
import 'package:CountDays/shared/constants.dart';
import 'package:CountDays/pages/loading.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final DatabaseServiceUser databaseServiceUser = DatabaseServiceUser();
  //unique key for form
  final _formKey = GlobalKey<FormState>();
  String error = '';

  //loading flag
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);
    //print("singin");
    return Scaffold(
      appBar: AppBarDays(),
      body: loading
          ? Loading()
          : Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton.icon(
                          icon: Icon(Icons.person),
                          label: Text('Register'),
                          color: Colors.pinkAccent[100],
                          onPressed: () => widget.toggleView(),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        style: TextStyle(
                            color: isDark ? Colors.black : Colors.white),
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        style: TextStyle(
                            color: isDark ? Colors.black : Colors.white),
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
                        ),
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.pink,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            //print(email);
                            //print(password);
                            //if validate each form
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              Person person = Person(uid: result.uid);
                              databaseServiceUser.updateFetureData(person);
                              print(person.uid);
                              print(person.feature);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Could not sign in with those credentials';
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
