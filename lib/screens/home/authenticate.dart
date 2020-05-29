import 'package:flutter/material.dart';
import 'package:login/screens/home/register.dart';
import 'package:login/screens/sign_in.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn=true;

  void alternarVista()  {
    setState(() => showSignIn= !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(showSignIn) {
      return SignIn(alternarVista: alternarVista);
    }else  {
      return Register(alternarVista: alternarVista);
    }
  }
}
