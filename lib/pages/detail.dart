import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/services/food.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Food food;

  @override
  Widget build(BuildContext context) {
    Map tempData = ModalRoute.of(context).settings.arguments;
    food = tempData["food"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("food detail"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(food.image),
                radius: 50.0,
              ),
            ),
            Divider(height: 90.0, color: Colors.grey[800]),
            Text(
              "NAME",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              food.name,
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "Description",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              food.description,
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  "${food.price} tg",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
