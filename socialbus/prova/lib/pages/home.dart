import 'package:flutter/material.dart';
import 'package:prova/widget/containerbus.dart';
import 'package:prova/data_storage/bus.dart';
import 'package:prova/widget/menu.dart';
List<Bus> allbus = [
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-4.pdf', direzione: 'VENEZIA-FAVARO ALTINA', nome: '4', ora: '12:00'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-4L.pdf', direzione: 'VENEZIA-MESTRE CENTRO', nome: '4L', ora: '11:10'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-9.pdf', direzione: 'SAN LIBERALE- VIA TEVERE', nome: '9', ora: '13:50'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-9H.pdf', direzione: 'OSPEDALE-ZENDRINI', nome: '9H', ora: '11:10'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-20.pdf', direzione: 'MARTELLAGO -MESTRE CENTRO', nome: '20', ora: '13:50'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-21.pdf', direzione: 'MARTELLAGO -MESTRE CENTRO', nome: '21', ora: '11:10'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-31H.pdf', direzione: 'OSPEDALE -MESTRE CENTRO', nome: '31H', ora: '13:50'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-32H.pdf', direzione: 'OSPEDALE -MESTRE CENTRO', nome: '32H', ora: '12:00'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-48H.pdf', direzione:'MARTELLAGO -MESTRE CENTRO', nome: '48H', ora: '11:10'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-T1.pdf', direzione: 'VENEZIA -MESTRE CENTRO', nome: 'T1', ora: '13:50'),
  Bus(orari: 'http://actv.avmspa.it/sites/default/files/attachments/pdf/UM/U-T2.pdf', direzione: 'VIA SALAMONIO -MESTRE CENTRO', nome: 'T2', ora: '11:10'),
];

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ciao',
      home: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Row(
            children: <Widget>[
              Icon(
                Icons.directions_bus,
              ),
              Text(
                'SocailBus',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width *0.75,
            child: ListView.builder(
              
                itemCount: allbus.length,
                itemBuilder: (BuildContext ctxt, int index) {
        return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/paginaBus',arguments: allbus[index]);
        },
                  child: new ContainerBus(
              orari: allbus[index].orari,
              nomeBus: allbus[index].nome,
              capolinea: allbus[index].direzione),
        );
                }),
          ),
      ),
    );
  }
}
