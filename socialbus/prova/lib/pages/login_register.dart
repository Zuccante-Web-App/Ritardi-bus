import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/pages/home.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prova/service/log_reg_Erorr.dart';

class Registration extends StatefulWidget {
  static const String id = "REGISTRATION";
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email;
  String password;
  String userName;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _colec;
  DocumentReference _documentReference;
  @override
  void initState() {
    _colec = Firestore.instance.collection('UserData');
    super.initState();
  }

  Future<void> registerUser() async {
        if(userName==null){
     throw new Exception("null user");
    }
    AuthResult user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.of(context, rootNavigator: true).pop();
    _documentReference = _colec.document(email);
    _documentReference.setData({
      "userName": userName,
    });
    UserData userData = UserData(userName: userName, user: email);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home(user: userData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexToColor("#0058A5"),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.directions_bus,
            ),
            Text(
              'SocialBus',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: ListView(
              
              children: <Widget>[
                 SizedBox(height: 40,),
                Center(
                  child: Text(
                    'SocialBus',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      fontSize: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Hero(tag: 'logo', child: Image.asset("assets/image/logo.png")),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextField(
                autocorrect: false,
                onChanged: (value) => userName = value,
                decoration: InputDecoration(
                  hintText: "Nome utente...",
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => email = value,
                decoration: InputDecoration(
                  hintText: "Inserisci email...",
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height:20.0,
              ),
              TextField(
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => password = value,
                decoration: InputDecoration(
                  hintText: "inserisci Password...",
                  border: const OutlineInputBorder(),
                ),
              ),
                SizedBox(
                height: 40.0,
              ),
              CustomButton(
                text: "Register",
                callback: () async {
                  try {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("caricamento log in"),
                          content: SpinKitWanderingCubes(
                            color: Colors.green[700],
                            size: 50.0,
                          ),
                        );
                      },
                    );
                    await registerUser();
                  } catch (e) {
                    Navigator.of(context, rootNavigator: true).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text( regErrorHandler(e.toString()),
                        ));
                      },
                    );
                  }
                },
              ),
               
            ],
          ),
        ],
      ),
    );
  }
}

class Login extends StatefulWidget {
  static const String id = "LOGIN";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    AuthResult user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    Navigator.of(context, rootNavigator: true).pop();
    UserData userData = UserData(user: email);
    userData.userDataFromSnapshot();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home(user: userData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexToColor("#0058A5"),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.directions_bus,
            ),
            Text(
              'SocialBus',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 40,),
                Center(
                  child: Text(
                    'SocialBus',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      fontSize: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Hero(tag: 'logo', child: Image.asset("assets/image/logo.png")),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => email = value,
                decoration: InputDecoration(
                  hintText: "Inserisci email...",
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => password = value,
                decoration: InputDecoration(
                  hintText: "Inserisci Password...",
                  border: const OutlineInputBorder(),
                ),
              ),
                SizedBox(
                height: 40.0,
              ),
              CustomButton(
                text: "Log In",
                callback: () async {
                  try {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text("caricamento log in"),
                          content: SpinKitWanderingCubes(
                            color: Colors.green[700],
                            size: 50.0,
                          ),
                        );
                      },
                    );
                    await loginUser();
                  } catch (e) {
                    Navigator.of(context, rootNavigator: true).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(logErrorHandler(e.toString())),
                          content: Text(""),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.blue[800],
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          child: Text(text),
        ),
      ),
    );
  }
}
