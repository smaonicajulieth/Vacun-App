import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/app/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text("Sign In VacunApp"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: RaisedButton(
            child: Text('Sign In Anonimo'),
            onPressed: () async {
              dynamic result = await _auth.SignInAnon();
              if (result == null) {
                print('Error logeando');
              } else {
                print('Logeado ');
                print(result);
              }
            },
          )),
    );
  }
}
