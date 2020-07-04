import 'package:flutter/material.dart';
import 'package:coffee_selector/models/coffee.dart';

class CoffeePanel extends StatelessWidget {

  final Coffee coffee;
  CoffeePanel({this.coffee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[coffee.strenght],
          ),
          title: Text(coffee.name),
          subtitle: Text('Takes ${coffee.sugars} sugar(s)'),
        ),
      )
    );
  }
}
