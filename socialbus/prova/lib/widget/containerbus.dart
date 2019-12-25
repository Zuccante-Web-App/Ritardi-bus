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
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[700],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 3.0,),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 5.0,
              blurRadius: 5.0,
            )
          ],
        ),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Text(
                'bus $nomeBus',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
              ),
              Text(
                'capolinea :\n $capolinea',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
              ),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () async {
                  if (await canLaunch(orari)) {
                    await launch(orari);
                  } else {
                    throw 'Could not launch $orari';
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
