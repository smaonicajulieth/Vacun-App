import 'package:login/screens/splashScreen.dart';
import 'package:flutter/material.dart';

class AppBasica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // utilizamos el material app para poder  hacer uso de las librerias de esta

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), //  Tema Claro
//      theme: ThemeData.dark(), // Tema Obscuro
      home: SplashScreen(),
    );
  }
}
