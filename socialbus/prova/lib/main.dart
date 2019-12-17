import 'package:flutter/material.dart';
import 'package:prova/pages/home.dart';
import 'package:prova/pages/pagina_bus.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) =>Home(),
        '/paginaBus': (context) =>PaginaBus(),
      },
    ));
