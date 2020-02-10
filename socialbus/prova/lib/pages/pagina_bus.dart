
import 'package:flutter/material.dart';
import "package:prova/data_storage/apirutes.dart";
import 'package:prova/data_storage/userData.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:prova/widget/chat.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginaBus extends StatefulWidget {
  final UserData user;
  final List<APIRoute> bus;
  PaginaBus({Key key, this.user, this.bus}) : super(key: key);

  @override
  _PaginaBusState createState() => _PaginaBusState();
}

class _PaginaBusState extends State<PaginaBus> {
  
  @override
  Widget build(BuildContext context) {
    String nomeBus = widget.bus[0].routeShortName;
    String urlString =
        "http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-$nomeBus.pdf";
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Text('$nomeBus'),
                IconButton(
                  icon: Icon(Icons.timelapse),
                  onPressed: () {
                    launch(urlString);
                  },
                )
              ],
            ),
            backgroundColor: hexToColor("#0058A5"),
          ),
          body: PageView.builder(
              itemCount: widget.bus.length,
              itemBuilder: (BuildContext context, int index) {
                String tratta = widget.bus[index].routeLongName.toUpperCase();
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      '$tratta',
                      style: TextStyle(fontSize: 12),
                    ),
                    backgroundColor: hexToColor("#0058A5"),
                  ),
                  body: Center(
                      child: Chat(bus: widget.bus[index], user: widget.user)),
                );
              })),
    );
  }
}
