import 'package:login/models/user.dart';
import 'package:login/screens/home/authenticate.dart';
import 'package:login/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
     //aca haremos que regrese o al login o al home
    if (user==null) {
      return Authenticate();
    }
    else  {
      return HomeScreen();
    }
  }
}
