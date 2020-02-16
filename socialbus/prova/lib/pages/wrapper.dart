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
                Text(
                  'SocialBus',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    fontSize: 40,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.10,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Hero(
                    tag: 'logo', child: Image.asset("assets/image/logo.png")),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
            ),
            Text("Hai gia un accaunt:"),
            CustomButton(
              text: "Log In",
              callback: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
            Text("Nuovo utente:"),
            CustomButton(
              text: "Registrati",
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
