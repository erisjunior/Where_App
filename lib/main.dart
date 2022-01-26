import 'package:flutter/material.dart';
import 'package:app/ui/register.dart';

void main() {
  const primaryColor = Color(0xFF902060);

  runApp(MaterialApp(
    title: "Where",
    home: const Register(),
    theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: primaryColor,
        fontFamily: 'DMSans'),
    debugShowCheckedModeBanner: false,
  ));
}
