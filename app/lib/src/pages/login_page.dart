import 'package:app/src/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controladores de entrada
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  //Variables de campos
  String _codigo;
  String _pin;

  //Validacion del boton
  bool _botonActivado = false;

  //Key del formulario
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
              height: 140.0,
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
        //Validacion del codigo
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
        onChanged: (value) {
          setState(() {
            if (value.isNotEmpty) {
              _botonActivado = true;
            } else {
              _botonActivado = false;
            }
          });
        },
        maxLength: 6,
        //Validacion del pin
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
        color: _botonActivado ? Colors.blueAccent : Colors.grey,
        textColor: Colors.white,
        onPressed: _botonActivado
            ? () async {
                //Validacion del formulario
                if (!_key.currentState.validate()) {
                  //Si tiene algun error lo retornamos
                  return;
                }
                //Guardamos los campos de entrada en las variables
                _key.currentState.save();

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SplashScreenPage(codigo: _codigo, pin: _pin),
                ));
              }
            : null);
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //Decoracion del fondo
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
          //Separacion del logo de 40 px
          padding: EdgeInsets.only(top: 40.0),
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
