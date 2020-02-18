import 'package:flutter/material.dart';
import 'package:prova/pages/home.dart';
import 'package:prova/pages/wrapper.dart';
import 'package:prova/pages/login_register.dart';

void main(){
  runApp(MaterialApp(
 
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/registration': (context) => Registration(),
      },
    ));
}