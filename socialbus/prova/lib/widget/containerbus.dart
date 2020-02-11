import 'package:flutter/material.dart';

class ContainerBus extends StatelessWidget {
  final String nomeBus;
  final String tratta;
  const ContainerBus({
    Key key,
    this.nomeBus,this.tratta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*    return Padding(
      padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 2.0,color: Colors.green[700]),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 2.0,
              blurRadius: 2.0,
            )
          ],
        ),
        child: Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Center(
                child: Text(
                  '$nomeBus',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900,color: Color.fromRGBO(1, 87, 164, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    */
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        0,
        0,
        8
      ),
      child: Container(
        height: MediaQuery.of(context).size.height*0.20,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0,15,10,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(nomeBus, style: TextStyle(
                  fontSize: 30,
                ),),
                Text(tratta,
                style: TextStyle(
                  fontSize: 20,
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
