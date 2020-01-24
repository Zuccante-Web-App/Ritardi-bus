
import 'package:flutter/material.dart';
import "package:prova/data_storage/apirutes.dart";
import 'package:url_launcher/url_launcher.dart';

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
            backgroundColor: Colors.green[700],
          ),
          body: PageView.builder(
              itemCount: bus.length,
              itemBuilder: (BuildContext context, int index) {
                String tratta = bus[index].routeLongName.toUpperCase();
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      'BUS $tratta',
                      style: TextStyle(fontSize: 12),
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
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child:Text("caio"),
                        ),
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
