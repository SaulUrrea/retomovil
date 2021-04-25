import 'package:app/src/models/recogidas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardRecogidasWidget extends StatefulWidget {
  final List<Recogida> recogidas;
  CardRecogidasWidget({Key key, @required this.recogidas});

  @override
  _CardRecogidasWidgetState createState() => _CardRecogidasWidgetState();
}

class _CardRecogidasWidgetState extends State<CardRecogidasWidget> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Swiper(
      itemWidth: _screenSize.width * 0.8,
      itemHeight: _screenSize.height * 0.2,
      layout: SwiperLayout.STACK,
      itemCount: widget.recogidas.length,
      itemBuilder: (context, index) {
        return cardRecogidas(widget.recogidas[index]);
      },
    );
  }

  Widget cardRecogidas(Recogida recogida) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
              title: Row(
                children: [
                  Text('¡Nueva recogida!',
                      style: TextStyle(color: Colors.blue)),
                  SizedBox(width: 5),
                  Text(recogida.ciudad, style: TextStyle(color: Colors.grey)),
                ],
              ),
              subtitle: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Text('${recogida.direccion}',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      SizedBox(height: 10),
                      Text("Unidades: ${recogida.unidades}",
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                      SizedBox(height: 20),
                    ],
                  ),
                  SizedBox(width: 70),
                  CircleAvatar(
                    child: Icon(Icons.bus_alert),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
