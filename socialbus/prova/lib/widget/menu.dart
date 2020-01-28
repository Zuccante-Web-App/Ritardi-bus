import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String urlTime = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
    String urlHome = '/Users/denisbellin/codice/Ritardi-bus/socialbus/prova/lib/pages/home.dart';
    String urlMoney = 'http://actv.avmspa.it/it/content/prezzi-vigore-0';
    String urlWrite = '';
    String urlRead = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
    String urlCom = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
    String urlSito = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
    

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.green[800]),
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
                      Icon(Icons.accessible_forward),
                      Text(
                        'ORARI',
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
                if (await canLaunch(urlMoney)) {
                  await launch(urlMoney);
                } else {
                  throw 'Could not launch $urlMoney';
                }
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.money_off),
                      Text(
                        'COSTI',
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
                if (await canLaunch(urlHome)) {
                  await launch(urlHome);
                } else {
                  throw 'Could not launch $urlHome';
                }
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.text_fields),
                      Text(
                        'HOME',
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
                      Icon(Icons.local_post_office),
                      Text(
                        'SCRIVI',
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
                      Icon(Icons.attach_money),
                      Text(
                        'LEGGI',
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
                      Icon(Icons.attach_money),
                      Text(
                        'COMUNICAZIONI',
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
                      Icon(Icons.attach_money),
                      Text(
                        'RIFERIMENTI AL SITO',
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
