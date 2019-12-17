import 'package:flutter/material.dart';
import 'package:prova/data_storage/bus.dart';

class PaginaBus extends StatefulWidget {
  PaginaBus({Key key}) : super(key: key);

  @override
  _PaginaBusState createState() => _PaginaBusState();
}

class _PaginaBusState extends State<PaginaBus> {
  @override
  Widget build(BuildContext context) {
    Bus bus = ModalRoute.of(context).settings.arguments;
    String nomeBus = bus.nome;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BUS $nomeBus'),
          backgroundColor: Colors.green[700],
        ),
        body: Text('xxx'),
      ),
    );
  }
}
