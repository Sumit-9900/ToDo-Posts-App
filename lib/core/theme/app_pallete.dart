import 'package:flutter/material.dart';

/// Palette for the dark theme
class DarkAppPalette {
  static const Color floatingActionButtonColor =
      Color.fromRGBO(134, 135, 231, 1);
  static const Color textColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color listTileColor = Color.fromRGBO(54, 54, 54, 1);
  static const Color circleAvatarBackgroundColor = Colors.grey;
  static const Color progressIndicatorColor = Colors.lightBlue;
}

/// Palette for the light theme
class LightAppPalette {
  static const Color floatingActionButtonColor =
      Color.fromRGBO(66, 135, 245, 1);
  static const Color textColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color listTileColor = Color.fromRGBO(230, 230, 230, 1);
  static const Color circleAvatarBackgroundColor = Colors.blueGrey;
  static const Color progressIndicatorColor = Colors.blueAccent;
}
