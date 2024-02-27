import 'package:flutter/material.dart';

class TextFieldModel {
  final TextEditingController controller;
  final Function(String? value) onSaved;
  final FocusNode focusNode;
  final String? Function(String?) onValidate;
  final void Function(String?) onChanged;

  const TextFieldModel({
    required this.controller,
    required this.onSaved,
    required this.focusNode,
    required this.onValidate,
    required this.onChanged,
  });

}
