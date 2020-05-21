import 'package:login/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServicioAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //log anonimo
  Future SignInAnon() async {
    try {
      AuthResult firstResult = await _auth.signInAnonymously();
      FirebaseUser usuario = firstResult.user;
      return usuario;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logear con email y password

  //registrarse con email y password

  //salida segura
}
