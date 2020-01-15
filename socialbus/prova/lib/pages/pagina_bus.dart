import 'package:flutter/material.dart';
import "package:prova/data_storage/apirutes.dart";

class PaginaBus extends StatefulWidget {
  PaginaBus({Key key}) : super(key: key);

  @override
  _PaginaBusState createState() => _PaginaBusState();
}

class _PaginaBusState extends State<PaginaBus> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    List<APIRoute> bus = ModalRoute.of(context).settings.arguments;
    String nomeBus = bus[0].routeShortName;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BUS $nomeBus'),
            backgroundColor: Colors.green[700],
          ),
          body: PageView.builder(
              itemCount: bus.length,
              itemBuilder: (BuildContext context, int index) {
                String tratta=bus[index].routeLongName.toUpperCase();
                return Scaffold(
                  appBar: AppBar(
                    title: Text('BUS $tratta',
                    style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Colors.green[700],
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
                );
              })),
    );
  }
}

/* Stack(
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
                ),*/
