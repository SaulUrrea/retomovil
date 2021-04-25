import 'package:flutter/cupertino.dart';

class User {
  final String nombreUsuario;
  final String codigoUsuario;
  final String pinUsuario;

  User(
      {@required this.nombreUsuario,
      @required this.codigoUsuario,
      @required this.pinUsuario});

  factory User.fromMap(dynamic data) {
    return User(
        nombreUsuario: data['nombre_usuario'],
        codigoUsuario: data['codigo_usuario'],
        pinUsuario: data['pin_usuario']);
  }

  Map<String, dynamic> toJson() => {
        'nombre_usuario': nombreUsuario,
        'codigo_usuario': codigoUsuario,
        'pin_usuario': pinUsuario
      };
}
