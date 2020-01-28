import 'package:flutter/material.dart';
import 'package:prova/pages/home.dart';
import 'package:prova/pages/pagina_bus.dart';
import 'package:prova/pages/wrapper.dart';
import 'package:prova/pages/login_register.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Wrapper(),
        '/home': (context) => Home(),
        '/paginaBus': (context) => PaginaBus(),
        '/login': (context) => Login(),
        '/registration': (context) => Registration(),
      },
    ));
