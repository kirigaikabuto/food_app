import 'package:flutter/material.dart';
import "package:food_app/pages/loading.dart";
import "package:food_app/pages/home.dart";
import "package:food_app/pages/detail.dart";

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/detail": (context) => Detail(),
    },
  ));
}
