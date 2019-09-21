import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:smart_city_by_bus/pages/Home.dart';
import 'package:smart_city_by_bus/pages/HowItWorks.dart';
import 'package:smart_city_by_bus/pages/Login.dart';
import 'package:smart_city_by_bus/pages/Redeem.dart';
import 'package:smart_city_by_bus/pages/Settings.dart';

final router = Router();

void defineRoutes(Router router) {
  /**
   * login route
   */
  router.define("/login", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Login();
  }));
  router.define("/home", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Home();
  }));
  router.define("/redeem", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Redeem();
  }));
  router.define("/settings", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Settings();
  }));
  router.define("/howItWorks", handler:
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HowItWorks();
  }));
}
