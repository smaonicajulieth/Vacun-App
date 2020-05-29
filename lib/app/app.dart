import 'package:login/app/auth.dart';
import 'package:login/models/user.dart';
import 'package:login/screens/home/wrapper.dart';
import 'package:login/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBasica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // utilizamos el material app para poder  hacer uso de las librerias de esta
// return del login anterior
  /*  return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), //  Tema Claro
//      theme: ThemeData.dark(), // Tema Obscuro
      home: SplashScreen(), esto es lo del login anterior, local
    );*/
  return StreamProvider<User>.value(
    value: AuthService().user,
    child: MaterialApp(
      home: Wrapper(),
    )
  );
  }
}
