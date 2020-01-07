import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContainerBus extends StatelessWidget {
  final String nomeBus;
  final String orari;
  final String capolinea;
  const ContainerBus({
    Key key,
    this.nomeBus,
    this.orari,
    this.capolinea,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 3.0,),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 2.0,
              blurRadius: 2.0,
            )
          ],
        ),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Center(
                child: Text(
                  '$nomeBus',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
