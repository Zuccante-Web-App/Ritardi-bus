import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova/data_storage/apirutes.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/pages/serchedBus.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:prova/widget/containerbus.dart';
import 'package:prova/widget/menu.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  final UserData user;
  Home({Key key, this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _serched = "";
  List<List<APIRoute>> buses = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        drawer: Menu(user: widget.user,),
        appBar: AppBar(
          backgroundColor: hexToColor("#0058A5"),
          title: Row(
            children: <Widget>[
              Icon(
                Icons.directions_bus,
              ),
              Text(
                'SocialBus',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 100),
              IconButton(
                icon: Icon(Icons.find_in_page),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                        title: Text("Inserisci Messaggio"),
                        content: Card(
                            child: Column(children: <Widget>[
                          Center(
                            child: Text("CERCA UN BUS:"),
                          ),
                          TextField(
                              keyboardType: TextInputType.text,
                              onChanged: (value) => _serched = value,
                              decoration: InputDecoration(
                                hintText: "Inserisci nome bus...",
                                border: const OutlineInputBorder(),
                              )),
                         FlatButton(
                              child: Text("Cerca"),
                              onPressed: () {
                               _serched!=""? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SerchedBus(
                                              buses: buses,
                                              serced: _serched.toUpperCase(),
                                              user: widget.user,
                                            ))):Navigator.pop(context);
                              })
                        ])));
                  },
                ),
              )
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            color: Colors.grey[200],
          ),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  25,
                  0,
                  0,
                ),
                //builder di "container_bus da flie json"
                child: Stack(
                  children: <Widget>[
                    Center(
                        child: Hero(
                            tag: 'logo',
                            child: Image.asset("assets/image/logo.png"))),
                    FutureBuilder(
                      future: loadRoutes(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return new ListView.builder(
                            itemCount: buses.length,
                            itemBuilder: (BuildContext context, int index) {
                              final List<APIRoute> routes = buses[index];
                              return ContainerBus(
                                bus: routes,
                                user: widget.user,
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return new Text("${snapshot.error}");
                        }
                        return new SpinKitWanderingCubes(
                          color: Colors.green[700],
                          size: 50.0,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//routes asset Json file
  Future<String> _loadRutesAsset() async {
    return await rootBundle.loadString('assets/json/routes.json');
  }

//jsons file to list of ApiRoutes
  Future<List<APIRoute>> loadRoutes() async {
    wait(30);
    buses = [];
    String jsonString = await _loadRutesAsset();
    final Iterable jsonResponse = json.decode(jsonString);
    List<APIRoute> routes = [];
    routes = jsonResponse.map((route) => APIRoute.fromJson(route)).toList();
    List<APIRoute> busList = [];
    for (int i = 0; i < routes.length - 1; i++) {
      busList.add(routes[i]);
      if (routes[i].routeShortName != routes[i + 1].routeShortName) {
        busSorting(busList);
        busList = [];
      }
    }
    return routes;
  }

  void busSorting(List<APIRoute> busList) {
    for(int i=0;i<busList.length-1;i++){
      if(busList[i].routeLongName==busList[i+1].routeLongName){
      busList.removeAt(i+1);
      i--;
      }
    }
    buses.add(busList);
  }

  Future wait(int seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => {});
  }
}
