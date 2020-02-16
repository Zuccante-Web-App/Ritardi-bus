import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prova/data_storage/apirutes.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/service/orariLauncher.dart';
import 'package:prova/widget/chat.dart';

class ContainerBus extends StatefulWidget {
  final List<APIRoute> bus;
  final UserData user;
  const ContainerBus({
    Key key,
    this.bus,
    this.user,
  }) : super(key: key);

  @override
  _ContainerBusState createState() => _ContainerBusState();
}

class _ContainerBusState extends State<ContainerBus> {
  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.24,
            child: Card(
              shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 15, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            widget.bus[0].routeShortName,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.access_time), onPressed: () {
                                launcherOrari(widget.bus[0].routeShortName);
                              })
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: MediaQuery.of(context).size.height * 0.80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.bus.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Chat(
                                            bus: widget.bus[index],
                                            user: widget.user)));
                              },
                              child: Padding(
                                   padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                                child: Container(
                                  width: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blue[(rng.nextInt(8)+1)*100] ,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                                    child: Text(
                                      widget.bus[index].routeLongName,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
