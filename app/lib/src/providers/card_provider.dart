import 'dart:convert';
import 'package:app/src/models/entregas.dart';
import 'package:app/src/models/recogidas.dart';
import 'package:http/http.dart' as http;

class CardProvider {
  //Traer informacion de las entregas
  Future<List<Entrega>> entregasResp() async {
    var url =
        "https://us-central1-cm-tim-dev.cloudfunctions.net/coordinadora_prueba/message/response";
    var resp = await http.post(url);
    final decodedData = json.decode(resp.body);

    final entregas =
        new Entregas.fromJsonList(decodedData["response"]["Entregas"]);

    return entregas.items;
  }

  //Traer informacion de las recogidas
  Future<List<Recogida>> recogidasResp() async {
    var url =
        "https://us-central1-cm-tim-dev.cloudfunctions.net/coordinadora_prueba/message/response";
    var resp = await http.post(url);
    final decodedData = json.decode(resp.body);
    final recogidas =
        new Recogidas.fromJsonList(decodedData["response"]["Recogidas"]);

    return recogidas.items;
  }

  Future<List> entregasTotal() async {
    var url =
        "https://us-central1-cm-tim-dev.cloudfunctions.net/coordinadora_prueba/message/response";
    var resp = await http.post(url);
    final decodedData = json.decode(resp.body);

    final entregas =
        new Entregas.fromJsonList(decodedData["response"]["Entregas"]);

    return entregas.items;
  }

  //Traer informacion de las recogidas
  Future<List> recogidasTotal() async {
    var url =
        "https://us-central1-cm-tim-dev.cloudfunctions.net/coordinadora_prueba/message/response";
    var resp = await http.post(url);
    final decodedData = json.decode(resp.body);
    final recogidas =
        new Recogidas.fromJsonList(decodedData["response"]["Recogidas"]);

    return recogidas.items;
  }
}
