import 'package:flutter/material.dart';

class CustomTheme {
  static TextStyle errorMsgStyle =
      const TextStyle(color: Colors.red, fontSize: 15);

  static List<ThemeData> themes = [
    ThemeData(
      primarySwatch: Colors.cyan,
    ),
    ThemeData(
      primarySwatch: Colors.brown,
    ),
    ThemeData(
      primarySwatch: Colors.yellow,
    ),
    ThemeData(
      primarySwatch: Colors.lightGreen,
    )
  ];
}
