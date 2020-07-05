import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
        borderSide: BorderSide(color: Colors.brown, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
        borderSide: BorderSide(color: Colors.blue, width: 2.0)));
