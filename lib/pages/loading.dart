import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart";
import "package:food_app/services/food.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupData() async {
    try {
      Response response = await get("http://192.168.1.2:8000/foods");
      List jsonData = jsonDecode(response.body);
      List<Food> foods = [];
      for (Map food in jsonData) {
        Food f = Food(
            id: food["id"],
            name: food["name"],
            image: food["image"],
            galery: food["images"],
            price: food["price"],
            description: food["description"]);
        foods.add(f);
        print(f.galery);
        Navigator.pushReplacementNamed(context, "/home",
            arguments: {"foods": foods});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitWanderingCubes(color: Colors.white, size: 50.0),
      ),
    );
  }
}
