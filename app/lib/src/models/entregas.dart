class Entregas {
  List<Entrega> items = new List();
  Entregas();
  Entregas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final entrega = new Entrega.fromJsonMap(item);
      items.add(entrega);
    }
  }
}

class Entrega {
  String guia;
  String unidades;
  Map posicion;
  String direccion;
  String destinatario;
  String ciudad;
  String celular;

  Entrega(
      {this.guia,
      this.unidades,
      this.posicion,
      this.direccion,
      this.destinatario,
      this.ciudad,
      this.celular});

  Entrega.fromJsonMap(Map<String, dynamic> json) {
    guia = json['guia'];
    unidades = json['unidades'];
    posicion = json['posicion'];
    direccion = json['direccion'];
    destinatario = json['destinatario'];
    ciudad = json['ciudad'];
    celular = json['celular'];
  }
}
