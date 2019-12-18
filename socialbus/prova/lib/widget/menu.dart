import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'impostazione.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = 'http://actv.avmspa.it/it/content/rete-venezia-unica-0';
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
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.local_movies),
                      Text(
                        'BIGLIETTI & COSTI',
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
