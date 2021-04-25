import 'package:app/src/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DataBase {
  List<User> usuarios;

  getUsuarios({String codigo, String pin}) async {
    try {
      await Firebase.initializeApp();
      final snapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('codigo_usuario', isEqualTo: codigo)
          .where('pin_usuario', isEqualTo: pin)
          .get();
      return usuarios =
          snapshot.docs.map((item) => User.fromMap(item)).toList();
    } on Exception catch (e) {
      print('Error al conectarse $e');
      return usuarios;
    }
  }
}
