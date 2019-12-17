import 'package:flutter/material.dart';



class Impostazioni extends StatelessWidget {
  final double whidth;

  Impostazioni({Key key, @required this.whidth}) : super(key: key);

  Widget build(BuildContext context) {
    return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            width:  whidth,
            
            child: Scaffold(
              appBar: AppBar(title: Text('impostazioni'),
              backgroundColor: Colors.greenAccent[900],),

            ));
  }
}