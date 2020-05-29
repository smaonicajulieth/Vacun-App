import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/app/auth.dart';

class SignIn extends StatefulWidget {
  final Function alternarVista;

  SignIn({ this.alternarVista});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey =GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  // estado para el textField registrar lo del text field
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text("Sign In VacunApp"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Registro'),
            onPressed:() {
              widget.alternarVista();},
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.isEmpty ? 'Ingresa un Email': null,
                onChanged: (val) {
                  setState(()=> email = val );
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                  validator: (val) => val.length < 8 ? 'Ingresa un password de al menos 8 caracteros': null,
                onChanged: (val){
                  setState(()=> password = val );

                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blueGrey,
                child: Text(''
                    'Iniciar Sesion / Login',
                  style: TextStyle(color:Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInwithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() => error='No pudimos iniciar sesion con esas credenciales');
                    }
                  }

                },
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
            ),
          ),
          //boton de logeo anonimo, va al lado del child donde esta el FORM
      /*
      RaisedButton(
            child: Text('Sign In Anonimo'),
            onPressed: () async {
              dynamic result = await _auth.SignInAnon();
              if (result == null) {
                print('Error logeando');
              } else {
                print('Logeado');
                print(result.uid);
              }
            },
          )
       */
      ),
    );
  }
}
