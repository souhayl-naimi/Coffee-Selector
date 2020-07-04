import 'package:coffee_selector/models/user.dart';
import 'package:coffee_selector/screens/authentication/authenticate.dart';
import 'package:coffee_selector/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return home or authenticate widget.
    if (user == null) {
      return Authenticate();
    }else{
      return Home();
    }
  }
}
