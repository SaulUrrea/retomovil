import 'package:flutter/material.dart';

class AlertWidget extends StatefulWidget {
  final BuildContext context;
  AlertWidget({Key key, @required this.context}) : super(key: key);

  @override
  _AlertWidgetState createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              title: Text('Error al conectarse a la base de datos'),
              actions: [
                TextButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Image(
                image: NetworkImage(
                    'https://artegelitalia.com.co/wp-content/uploads/2017/06/coordinadora.png')),
            SizedBox(height: 10),
            Text(
              'Cargando ...',
              style: TextStyle(fontSize: 20),
            ),
            Container(
                padding: EdgeInsets.all(25),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  minHeight: 25,
                )),
          ],
        ),
      ),
    );
  }
}
