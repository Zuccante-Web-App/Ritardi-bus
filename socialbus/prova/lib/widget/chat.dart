
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:prova/widget/msg.dart';



class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with TickerProviderStateMixin {
  final List<Msg> _message = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar : new AppBar(
        title: new Text("ChatApplication"),
        elevation: 
        Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
        ),
        body: new Column(children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemBuilder: (_, int index) => _message[index],
              itemCount: _message.length,
              reverse: true,
              padding: new EdgeInsets.all(6.0),
          )),
          new Divider(height: 1.0),
          new Container(
            child: _buildComposer(),
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          )
        ]),
    );
  }
  Widget _buildComposer(){
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 9.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String txt) {
                  setState(() {
                    _isWriting = txt.length > 0;
                  });
                },
                onSubmitted: _submitMsg,
                decoration: 
                new InputDecoration.collapsed(hintText: "Entersome text to send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 3.0),
              child: Theme.of(context).platform == TargetPlatform.iOS
              ? new CupertinoButton(
                child: new Text("submit"),
                onPressed: _isWriting ? () => _submitMsg(_textController.text)
                : null
              )
              : new CupertinoButton(
                child: new Icon(Icons.message),
                onPressed: _isWriting
                ? () => _submitMsg(_textController.text)
                : null,
              )
            )
          ],
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
        ? new BoxDecoration(
          border: 
          new Border(top: new BorderSide(color: Colors.brown[200]))
        ):
        null
      ),
    );
  }

    void _submitMsg(String txt){
      _textController.clear();
      setState(() {
        _isWriting = false;
      });
      Msg msg = new Msg(
        txt: txt,
        animationController: new AnimationController(
          vsync: this,
          duration: new Duration(milliseconds: 800)
        ),
      );
      setState(() {
        _message.insert(0, msg);
      });
      msg.animationController.forward();
    }
    @override 
  void dispose(){
    for (Msg msg in _message){
      msg.animationController.dispose();
    }
    super.dispose();
  }

}
