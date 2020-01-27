import 'package:flutter/material.dart';
import 'login_register.dart';

class Wrapper extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    width: 100.0,
                    child: Image.asset("assets/image/logo.jpeg"),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'SocialBus',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                        fontSize: 50,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 7
                          ..color = Colors.black,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'SocialBus',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                        fontSize: 50,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            CustomButton(
              text: "Log In",
              callback: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
            CustomButton(
              text: "Register",
              callback: () {
                Navigator.of(context).pushNamed('/registration');
              },
            )
          ],
        ),
      ),
    );
  }
}
