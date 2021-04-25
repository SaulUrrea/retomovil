class Recogidas {
  List<Recogida> items = new List();
  Recogidas();
  Recogidas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final recogida = new Recogida.fromJsonMap(item);
      items.add(recogida);
    }
  }
}

class Recogida {
  String recogida;
  String unidades;
  Map posicion;
  String direccion;
  String solicitante;
  String ciudad;
  String celular;

  Recogida(
      {this.recogida,
      this.unidades,
      this.posicion,
      this.direccion,
      this.solicitante,
      this.ciudad,
      this.celular});

  Recogida.fromJsonMap(Map<String, dynamic> json) {
    recogida = json['recogida'];
    unidades = json['unidades'];
    posicion = json['posicion'];
    direccion = json['direccion'];
    solicitante = json['solicitante'];
    ciudad = json['ciudad'];
    celular = json['celular'];
  }
}
