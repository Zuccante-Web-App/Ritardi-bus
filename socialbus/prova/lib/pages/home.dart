import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova/data_storage/bus.dart';
import 'package:prova/data_storage/apirutes.dart';
import 'package:prova/widget/containerbus.dart';
import 'package:prova/data_storage/allbus.dart';
import 'package:prova/widget/menu.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AllBus allBus = new AllBus();

  @override
  Widget build(BuildContext context) {
    List<Bus> allbus = allBus.getAllBus();
    return MaterialApp(
      title: 'SocialBus',
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
                'SocialBus',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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
                child: FutureBuilder(
                  future: loadRoutes(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return new GridView.builder(
                        itemCount: allbus.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final List<APIRoute> routes=snapshot.data;
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/paginaBus', arguments: routes[index]);
                            },
                            child: new ContainerBus(
                                nomeBus:   routes[index].routeShortName,
                                capolinea: routes[index].routeLongName,
                                    ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 5.0,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return new Text("${snapshot.error}");
                    }
                    return new CircularProgressIndicator();
                  },
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
    String jsonString = await _loadRutesAsset();

    final Iterable jsonResponse = json.decode(jsonString);
    List<APIRoute> routes = [];
    routes = jsonResponse.map((route) => APIRoute.fromJson(route)).toList();
    return routes;
  }

  Future wait(int seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => {});
  }
}