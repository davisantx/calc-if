import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  
  final void Function()? action;
  
   const ButtonWidget({
    super.key,
    required this.text,
    required this.action,
    this.height = 40,
    this.width = 115,
  });

  const ButtonWidget.customSize({
    super.key,
    required this.text,
    required this.action,
    required this.height,
    required this.width,
  });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: width,
          height: height,
        ),
        child: ElevatedButton(
          onPressed: action,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
