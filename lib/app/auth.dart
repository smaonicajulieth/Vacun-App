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
  // cambios de autenticacion por STREAMs

  Stream<User> get user {
    return _auth.onAuthStateChanged
    //  .map((FirebaseUser user ) => _userFromFirebaseUser(user)); la linea de abajo realiza lo mismo,
    //  pasa un usuario de nuestra clase cuando hay cambios en el login o logout
    .map(_userFromFirebaseUser);
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
  Future signInwithEmailAndPassword(String email,String password) async {
    try {
      AuthResult result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //registrarse con email y password
  Future registerwithEmailAndPassword(String email,String password) async {
    try {
      AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
          return null;
    }
  }
  //Logout
Future signOut() async{
    try {
  return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
}

}
