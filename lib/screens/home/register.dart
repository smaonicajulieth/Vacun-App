import 'package:flutter/material.dart';
import 'package:login/app/auth.dart';

class Register extends StatefulWidget {

  final Function alternarVista;
  Register({ this.alternarVista});
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey =GlobalKey<FormState>();

  //Estado del textField, captar los datos mejor dicho xD
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
        title: Text("Registrate en VacunApp"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Login'),
            onPressed:() {
              widget.alternarVista();
            },
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
                    'Registro',
                  style: TextStyle(color:Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerwithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() => error='Ingrese un email Valido' );
                    }
                  }
                }
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),

      ),
    );
}
}
