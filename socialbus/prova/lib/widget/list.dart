import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prova/data_storage/rutes.dart';

class CountyList extends StatelessWidget {
  final List<APIRoute> country;
  CountyList({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: country == null ? 0 : country.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
              child: new Center(
                  child: new Column(
                // Stretch the cards in horizontal axis
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Text(
                    country[index].routeId.toString(),
                    style: new TextStyle(
                        fontSize: 20.0, color: Colors.lightBlueAccent),
                  ),
                  new Text(
                    "Capital:- " + country[index].routeLongName,
                    style: new TextStyle(fontSize: 20.0, color: Colors.amber),
                  ),
                ],
              )),
              padding: const EdgeInsets.all(15.0),
            ),
          );
        });
  }
}
