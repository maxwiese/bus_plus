import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city_by_bus/router.dart';
import 'package:flutter_blue/flutter_blue.dart';

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
        accentColor: Color(0xFF55C9A6),
        primaryColor: Color(0xFF025D5E),
      ),
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return Login();
            }
          }),
      onGenerateRoute: router.generator,
    );
  }
}
