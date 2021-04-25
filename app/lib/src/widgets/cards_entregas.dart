import 'package:app/src/models/entregas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardEntregasWidget extends StatefulWidget {
  final List<Entrega> entregas;
  CardEntregasWidget({Key key, @required this.entregas});

  @override
  _CardEntregasWidgetState createState() => _CardEntregasWidgetState();
}

class _CardEntregasWidgetState extends State<CardEntregasWidget> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Swiper(
      itemWidth: _screenSize.width * 0.8,
      itemHeight: _screenSize.height * 0.2,
      layout: SwiperLayout.STACK,
      itemCount: widget.entregas.length,
      itemBuilder: (context, index) {
        return cardEntregas(widget.entregas[index]);
      },
    );
  }

  Widget cardEntregas(Entrega entrega) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
              title: Row(
                children: [
                  Text('¡Nueva entrega!', style: TextStyle(color: Colors.blue)),
                  SizedBox(width: 10),
                  Text(entrega.ciudad, style: TextStyle(color: Colors.grey)),
                ],
              ),
              subtitle: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Text(entrega.guia,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      SizedBox(height: 10),
                      Text("Unidades: ${entrega.unidades}",
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                      SizedBox(height: 20),
                    ],
                  ),
                  SizedBox(width: 90),
                  CircleAvatar(
                    child: Icon(Icons.pedal_bike_rounded),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
