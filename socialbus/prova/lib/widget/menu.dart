import 'package:flutter/material.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String urlTime = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
    String urlWrite = '';
    String urlRead = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
    String urlCom = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
    String urlSito = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
    

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
            decoration: BoxDecoration(color:  hexToColor("#0058A5")),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'MENU',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
              GestureDetector(
              onTap: () async {
                if (await canLaunch(urlRead)) {
                  await launch(urlRead);
                } else {
                  throw 'Could not launch $urlRead';
                }
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.import_contacts),
                      Text(
                        '  LEGGI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              GestureDetector(
              onTap: () async {
                if (await canLaunch(urlWrite)) {
                  await launch(urlWrite);
                } else {
                  throw 'Could not launch $urlWrite';
                }
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.mode_edit),
                      Text(
                        '  SCRIVI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          GestureDetector(
              onTap: () async {
                if (await canLaunch(urlTime)) {
                  await launch(urlTime);
                } else {
                  throw 'Could not launch $urlTime';
                }
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      Text(
                        '  ORARI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              GestureDetector(
              onTap: () async {
                if (await canLaunch(urlCom)) {
                  await launch(urlCom);
                } else {
                  throw 'Could not launch $urlCom';
                }
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.assignment),
                      Text(
                        '  COMUNICAZIONI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              GestureDetector(
              onTap: () async {
                if (await canLaunch(urlSito)) {
                  await launch(urlSito);
                } else {
                  throw 'Could not launch $urlSito';
                }
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.cloud_queue),
                      Text(
                        '  SITO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ))
              
        ],
      ),
    );
  }
}
