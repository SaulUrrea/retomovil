import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar({Key key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
