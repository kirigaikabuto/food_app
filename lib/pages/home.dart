import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:food_app/services/food.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Food> foods = [];

  @override
  Widget build(BuildContext context) {
    Map tempData = ModalRoute.of(context).settings.arguments;
    foods = tempData["foods"];
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Foods List"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                  child: Card(
                      child: ListTile(
                          onTap: () async{
                            // dynamic result = await Navigator.pushReplacementNamed(context, "/detail",
                            //     arguments: {"food": foods[index]});
                            dynamic result = await Navigator.pushNamed(context, "/detail", arguments: {"food": foods[index]});
                          },
                          title: Text(foods[index].name),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(foods[index].image),
                          ),
                          trailing: Text(
                            "${foods[index].price.toString()} Tg",
                          ),
                          subtitle: Text("nyaaa"))));
            }),
      ),
    );
  }
}
