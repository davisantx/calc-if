import 'package:flutter/material.dart';

class Validator {

  static String? check(String? value) {
    return _checkVoid(value!) == null ? _check10(value) == null ? null : _check10(value) : _checkVoid(value);
  }

  static bool confirmValidation(GlobalKey<FormState> formKey) {
    return formKey.currentState!.validate();
  }

  static String? _checkVoid(String value) {
    if(value.isEmpty) return 'Vazio';
    return null;
  }
  static String? _check10(String? value) {
    if(double.parse(value!) > 10.0 || double.parse(value) < 0.0) return 'Inválido';
    return null;
  }
}