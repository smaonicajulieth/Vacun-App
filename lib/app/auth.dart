import 'package:login/models/user.dart';
import 'package:login/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //crear un usuario basado el el usurio anonimo que crea firebase
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //log anonimo
  Future SignInAnon() async {
    try {
      AuthResult firstResult = await _auth.signInAnonymously();
      FirebaseUser user = firstResult.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logear con email y password

  //registrarse con email y password

  //salida segura
}
