import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  String _codigo;
  String _pin;

  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  Text('Login', style: TextStyle(fontSize: 25.0)),
                  SizedBox(height: 60.0),
                  _crearCodigo(),
                  SizedBox(height: 30.0),
                  _crearPassword(),
                  SizedBox(height: 30.0),
                  _crearBoton(_key)
                ],
              ),
            ),
          ),
          FlatButton(
            child: Text('Crear una nueva cuenta'),
            onPressed: () {},
          ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearCodigo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        validator: (text) {
          final isDigitsOnly = int.tryParse(text);
          if (text.length == 0 || text.length < 6) {
            return "Este campo debe de tener minimo 6 digitos";
          } else if (isDigitsOnly == null) {
            return "Se necesita solo valores numericos";
          }
          return null;
        },
        onSaved: (text) => _codigo = text,
        controller: _codigoController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.contacts_rounded, color: Colors.blue[900]),
          labelText: 'Codigo de empleado',
        ),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        maxLength: 6,
        validator: (text) {
          if (text.length < 4) {
            return "Este campo debe de tener minimo 4 digitos";
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock_outline, color: Colors.blue[900]),
            labelText: 'Pin',
            counterText: ''),
        onSaved: (text) => _pin = text,
      ),
    );
  }

  Widget _crearBoton(_key) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Colors.blueAccent,
      textColor: Colors.white,
      onPressed: () {
        if (!_key.currentState.validate()) {
          return;
        }
        _key.currentState.save();
      },
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: <Color>[Colors.blueGrey, Colors.white])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Image(
                  image: NetworkImage(
                      'https://artegelitalia.com.co/wp-content/uploads/2017/06/coordinadora.png')),
            ],
          ),
        )
      ],
    );
  }
}