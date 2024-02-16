import 'package:flutter/material.dart';

class NavigatorApp {
  static void navigatorTo(BuildContext context, Widget screen) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => screen
      )
    );
  }
}