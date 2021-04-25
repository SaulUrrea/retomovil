import 'package:app/src/providers/card_provider.dart';
import 'package:app/src/widgets/cards_entregas.dart';
import 'package:app/src/widgets/cards_recogidas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  final String codigo;
  final String pin;

  InicioPage({@required this.codigo, @required this.pin});

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  CardProvider datos = new CardProvider();
  String nombre;
  int entregasTotal;
  int recogidasTotal;

  @override
  void initState() {
    super.initState();
    getNombre(documento: widget.codigo);
  }

  @override
  Widget build(BuildContext context) {
    Future<List> datosrec = datos.recogidasResp();
    Future<List> datosent = datos.entregasResp();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 200,
        title: Column(
          children: [
            ListTile(
              trailing: IconButton(
                iconSize: 20,
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.blue,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              subtitle: Text(
                'Estas son tus tareas pendientes',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 20),
              ),
              title: Text(
                'Bienvenido, $nombre',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25),
              ),
            ),
            Center(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Text('$entregasTotal'),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'ENTREGAS',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(width: 35),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Text('$recogidasTotal'),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'RECOGIDAS',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          mostrarEntregas(context, datosent),
          mostrarRecogidas(context, datosrec)
        ],
      )),
    );
  }

  getNombre({String documento}) async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(documento)
        .get()
        .then((value) {
      setState(() {
        nombre = value['nombre_usuario'];
      });
    });
  }

  Widget mostrarEntregas(BuildContext context, Future<List> datosent) {
    return FutureBuilder(
      future: datosent,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          entregasTotal = snapshot.data.length;
          return CardEntregasWidget(entregas: snapshot.data);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  mostrarRecogidas(BuildContext context, Future<List> datorec) {
    return FutureBuilder(
      future: datorec,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          recogidasTotal = snapshot.data.length;
          return CardRecogidasWidget(recogidas: snapshot.data);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
