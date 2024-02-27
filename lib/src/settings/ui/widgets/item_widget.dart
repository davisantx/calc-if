import 'package:calc_if/src/app/navigator/navigator_app.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final dynamic screen;

  const ItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.trailing,
    required this.screen
  });

  @override
  Widget build(BuildContext context) {
    return ListTile( 
      leading: Icon(icon),
      title: Text(
        title, 
      ),
      trailing: trailing,
      onTap: screen == null
        ? null
        : () {
          NavigatorApp.navigatorTo(context, screen);
        },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
  }
}
