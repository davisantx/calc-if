import 'package:flutter/material.dart';

class ConfiguracoesModel {
  List<String> titulos = [];
  List<IconData> icones = [];
  List<dynamic> telas = [];
  bool chave = false;

  ConfiguracoesModel({
    required this.titulos, 
    required this.icones, 
    required this.telas, 
    required this.chave
  });
}