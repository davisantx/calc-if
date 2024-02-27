import 'package:flutter/material.dart';

class ModalBottomSheetWithHeaderWidget extends StatelessWidget {
  final String titleHeader;
  final List<Widget> content;

  const ModalBottomSheetWithHeaderWidget({
    super.key, 
    required this.titleHeader, 
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 21,
          left: 20,
          child: Text(
            titleHeader,
            style: const TextStyle(
              fontSize: 22,
            ),
          )
        ),
        ...content
      ],
    );
  }
}
