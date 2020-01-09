import 'package:flutter/material.dart';
import 'package:prova/data_storage/bus.dart';
import 'package:http/http.dart';
import 'dart:convert';

class PaginaBus extends StatefulWidget {
  PaginaBus({Key key}) : super(key: key);

  @override
  _PaginaBusState createState() => _PaginaBusState();
}

class _PaginaBusState extends State<PaginaBus> {
  Future<void> orari() async {
    {
      String data = await DefaultAssetBundle.of(context).loadString("assets/json/routes.json");
      Map x = jsonDecode(data);
      print(x);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    Bus bus = ModalRoute.of(context).settings.arguments;
    String nomeBus = bus.nome;
    orari();
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BUS $nomeBus'),
            backgroundColor: Colors.green[700],
          ),
          body: PageView(
            children: <Widget>[
              Scaffold(
                appBar: AppBar(
                  leading: Container(),
                  title: Text('ANDATA'),
                  backgroundColor: Colors.green[900],
                ),
                body: Stack(
                  children: <Widget>[
                    Center(
                      child: new Image.asset(
                        'assets/image/kent-vista-frontale1.jpg',
                        width: _size.width,
                        height: _size.height,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: <Widget>[],
                      ),
                    )
                  ],
                ),
              ),
              Scaffold(
                appBar: AppBar(
                  leading: Container(),
                  title: Text('RITORNO'),
                  backgroundColor: Colors.green[900],
                ),
                body: Stack(
                  children: <Widget>[
                    Center(
                      child: new Image.asset(
                        'assets/image/bus-dietro.jpg',
                        width: _size.width,
                        height: _size.height,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Text("This is a Text",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
