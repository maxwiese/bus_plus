import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_by_bus/router.dart';

import 'package:smart_city_by_bus/pages/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    defineRoutes(router);
    return MaterialApp(
      title: 'Bus +',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Login(),
      onGenerateRoute: router.generator,
    );
  }
}
