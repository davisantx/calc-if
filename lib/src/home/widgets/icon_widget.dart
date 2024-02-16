import 'package:calc_if/src/app/navigator/navigator_app.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Widget screenNavigator;

  const IconWidget({
    super.key, 
    required this.icon, 
    required this.screenNavigator
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 30.0,
      padding: const EdgeInsets.all(10),
      onPressed: () {
        NavigatorApp.navigatorTo(context, screenNavigator);
      },
    );
  }
}
