import 'package:flutter/material.dart';
import 'package:login/app/auth.dart';
import 'package:login/screens/home/authenticate.dart';
import '';
class HomeScreen extends StatelessWidget {

final AuthService _auth =AuthService();

@override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       title: Text('VacunApp'),
       backgroundColor: Colors.indigo,
       elevation:  0.0,
       actions: <Widget>[
         FlatButton.icon(
           icon: Icon(Icons.person),
           label: Text('Logout'),
           onPressed: () async{
             await _auth.signOut();
           },
         )
       ],
     ),
   );
  }



    //pantalla de inicio despues de login de prubea, esta vacia
    /*
     static Route<dynamic> route(String mensaje) {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(mensaje: mensaje),
    );
  }

  final String mensaje;

  const HomeScreen({Key key, @required this.mensaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                mensaje,
                style: TextStyle(
                  fontSize: 32.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );*/
}

