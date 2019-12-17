import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'impostazione.dart';

void main() => runApp(AnimatedContainerApp());

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  double _width = 25;
  double _height = 1000;
  bool _status = false;
  Color _color = Colors.green[600];
  double _impwidth = 0;
//  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  void stateChange() {
    setState(() {
      _status ? {_width = 25, _status = false} : {_width = 100, _status = true};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
            // Use the properties stored in the State class.
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
            ),
            // Define how long the animation should take.
            duration: Duration(milliseconds: 500),
            // Provide an optional curve to make the animation feel smoother.
            curve: Curves.fastOutSlowIn,
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: () {
                        stateChange();
                      },
                      child: Icon(Icons.reorder)),
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                        'http://actv.avmspa.it/it/content/linee-urbane-0');
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.today),
                      Text(_status ? 'orari' : ''),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.arrow_forward),
                    Text(_status ? 'log in' : ''),
                  ],
                ),
              ],
            )),
        Impostazioni(whidth: _impwidth),
      ],
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
