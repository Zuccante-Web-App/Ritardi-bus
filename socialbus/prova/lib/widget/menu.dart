import 'package:flutter/material.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/pages/home.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  final UserData user;
  const Menu({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          
             new UserAccountsDrawerHeader(
              accountName: new Text(user.userName),
              accountEmail: new Text(user.user),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage("https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"),
              ),
              decoration: BoxDecoration(color: hexToColor("#0058A5")),
            ),
            
          
          ListTile(
            leading: Icon(
              Icons.import_contacts,
              color: Colors.grey[700],
              ),
            
            title: Text('Leggi'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
          ListTile(
            leading: Icon(
              Icons.mode_edit,
              color: Colors.grey[700],
              ),
            title: Text('Scrivi'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
          ListTile(
            leading: Icon(
              Icons.access_time,
              color: Colors.grey[700],
              ),
            title: Text('Orari'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
          ListTile(
            leading: Icon(
              Icons.assignment,
              color: Colors.grey[700],
              ),
            title: Text('Comunicazioni'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
          ListTile(
            leading: Icon(
              Icons.cloud_queue,
              color: Colors.grey[700],
              ),
            title: Text('Sito'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
        ],
      ),
    );
  }
}
