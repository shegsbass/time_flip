
import 'package:flutter/material.dart';
import 'package:time_flip/screens/home.dart';
import 'package:time_flip/screens/loading.dart';
import 'package:time_flip/screens/choose_location.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',

  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));


