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
              title: Text(
                  'Usuario Invalido o no existe en nuestra base de datos.'),
              actions: [
                TextButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Image(image: AssetImage('assets/img/logo.png')),
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
