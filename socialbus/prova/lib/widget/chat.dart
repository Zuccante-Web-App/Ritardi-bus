import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prova/data_storage/apirutes.dart';

class Chat extends StatefulWidget {
  final APIRoute bus;
  final FirebaseUser user;
  Chat({Key key, this.bus, this.user}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  CollectionReference _colec;
  Map map;
  final Firestore _firestore = Firestore.instance;
  @override
  initState() {
    setUp();
    super.initState();
  }

  void setUp() async {
    _colec = Firestore.instance.collection(widget.bus.routeLongName);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user.email);
    TextEditingController _textFieldController = TextEditingController();
    Map<String, dynamic> data = Map<String, dynamic>();
    String txt;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Text("CHAT"),
          ),
          Container(
            child: FlatButton(
              child: Text("Aggiungi messaggio"),
              onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                      title: Text("Inserisci Messaggio"),
                      content: Card(
                        child: new TextField(
                            controller: _textFieldController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => txt = value,
                            decoration: InputDecoration(
                              hintText: "Inserisci Testo...",
                              border: const OutlineInputBorder(),
                            )),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Invia"),
                          onPressed: () {
                            print(txt);
                            _colec.add({
                              'messaggio': txt,
                              "user": widget.user.email,
                              "date":
                                  DateTime.now().toIso8601String().toString(),
                            });
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        )
                      ]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
