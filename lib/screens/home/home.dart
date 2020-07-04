import 'package:coffee_selector/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_selector/services/database.dart';
import 'package:provider/provider.dart';
import 'package:coffee_selector/screens/home/coffee_list.dart';
import 'package:coffee_selector/models/coffee.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Coffee>>.value(
      value: DatabaseService().coffees,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Coffee Selector"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: CoffeeList(),
      ),
    );
  }
}
