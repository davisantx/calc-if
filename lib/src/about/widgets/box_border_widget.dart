import 'package:flutter/material.dart';

class BoxBorderWidget extends StatelessWidget {
  final String title;
  const BoxBorderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3.0, 
          color: Colors.black
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
    );
  }
}