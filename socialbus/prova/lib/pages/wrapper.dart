import 'package:flutter/material.dart';
import 'package:prova/service/graphicFn.dart';
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
        child: Stack(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 1.00,
                height: MediaQuery.of(context).size.height * 0.80,
                decoration: BoxDecoration(color: hexToColor("#0058A5"))),
            Container(
              height: 300,
              margin: EdgeInsets.all(100.0),
              decoration:
                  BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                  ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
<<<<<<< HEAD
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
=======
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.10,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Hero(
                        tag: 'logo',
                        child: Image.asset("assets/image/logo.png")
                        ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.25,
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
>>>>>>> 3d0b526c71b6d03b30a166644c8b9364501b4f8a
          ],
        ),
      ),
    );
  }
}
