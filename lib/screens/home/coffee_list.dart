import 'package:flutter/material.dart';
import 'package:coffee_selector/models/coffee.dart';
import 'package:provider/provider.dart';
import 'package:coffee_selector/screens/home/coffee_panel.dart';

class CoffeeList extends StatefulWidget {
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    final coffees = Provider.of<List<Coffee>>(context)??[];
    /*   //print(coffees.documents);
    for(var doc in coffees.documents){
      print(doc.data);
    }*/
    coffees.forEach((coffee) {
      print(coffee.name);
      print(coffee.sugars);
      print(coffee.strenght);
    });
    return ListView.builder(
        itemCount: coffees.length,
        itemBuilder: (context, index) {
          return CoffeePanel(coffee: coffees[index]);
        },
    );
  }
}
