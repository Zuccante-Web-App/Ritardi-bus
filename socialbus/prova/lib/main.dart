import 'package:flutter/material.dart';
import 'package:prova/pages/home.dart';
import 'package:prova/pages/login_register.dart';
import 'package:prova/pages/pagina_bus.dart';
import 'package:prova/pages/radice.dart';
import 'package:prova/widget/chat.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) =>Home(),
        '/paginaBus': (context) =>PaginaBus(),
        MyHomePage.id: (context) => MyHomePage(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat(),
      },
    ));
