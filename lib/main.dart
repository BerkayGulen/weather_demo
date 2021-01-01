import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_demo/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
    },
  ));
}
