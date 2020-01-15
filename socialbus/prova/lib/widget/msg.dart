import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Msg extends StatelessWidget{
  Msg({this.txt, this.animationController});
  final String txt;
  final AnimationController animationController;

@override
Widget build(BuildContext ctx) {
  return new SizeTransition(sizeFactor: new CurvedAnimation(
    parent: animationController,
    curve: Curves.easeOut
),
axisAlignment: 0.0,
child: new Container(
  margin: const EdgeInsets.symmetric(vertical: 8.0),
  child: new Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 18.0),
        child: new CircleAvatar(child: new Text ("alberto")),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("alberto", style: Theme.of(ctx).textTheme.subhead),
            new Container(
              margin: const EdgeInsets.only(top: 6.0),
              child: new Text(txt),
            )
          ],
        ),
      )
    ],
  ),
),
);
}
}