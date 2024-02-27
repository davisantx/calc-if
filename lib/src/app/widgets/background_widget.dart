import 'package:flutter/material.dart';
import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:provider/provider.dart';
import 'package:calc_if/src/themes/repository/themes_repository.dart' as themes_repository;

class Background extends StatelessWidget {
  final Widget? content;
  final int index;
  final bool isBackground;
  final bool isCustomBorder;
  final double borderRadius;

  const Background({
    super.key,
    required this.content,
    required this.index,
  }) : this.isBackground = true, this.borderRadius = 0.0, this.isCustomBorder = false;

  const Background.demonstrative({
    super.key,
    required this.content,
    required this.index,
  }) : this.isBackground = false, this.borderRadius = 0.0, this.isCustomBorder = false;

  const Background.withBorder({
    super.key,
    required this.content,
    required this.index,
    required this.borderRadius,
  }) : this.isBackground = false, this.isCustomBorder = true;
  
  @override
  Widget build(BuildContext context) {
    return isBackground ? Consumer<SettingsApp>(
      builder: (context, _, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: themes_repository.themes[SettingsApp.settingsAppInstance.getTheme()].colors,
              stops: const [0, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
          child: content,
        );
      } 
    ) 
    : 
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themes_repository.themes[index].colors,
          stops: const [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: isCustomBorder ? BorderRadius.all(Radius.circular(borderRadius)) : null
      ),
      child: content,
    );
  }
}


