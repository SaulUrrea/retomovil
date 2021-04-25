import 'package:app/src/widgets/alerts.dart';
import 'package:app/src/models/users.dart';
import 'package:app/src/pages/inicio_page.dart';
import 'package:app/src/services/database.dart';
import 'package:app/src/widgets/progressBar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  final String codigo;
  final String pin;

  SplashScreenPage({@required this.codigo, @required this.pin});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  //Llamado a la base de datos
  DataBase database = new DataBase();

  //Instancia de usuario
  List<User> usuario;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(widget.codigo, widget.pin),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return AlertWidget(context: context);
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (usuario.isEmpty) {
            return AlertWidget(context: context);
          } else {
            return InicioPage(
              codigo: widget.codigo,
              pin: widget.pin,
            );
          }
        }
        return ProgressBar();
      },
    );
  }

  getData(codigo, pin) async {
    //Conectamos con la base de datos
    await Firebase.initializeApp();
    //Validamos usuario
    usuario = await database.getUsuarios(codigo: codigo, pin: pin);
  }
}
