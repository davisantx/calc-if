import 'package:calc_if/constants/keys.dart';
import 'package:calc_if/storage/storage.dart';
import 'package:flutter/material.dart';

class SettingsController {
  List<String> titulos = [];
  List<IconData> icones = [];
  List<dynamic> telas = [];
  bool chave = false;

  SettingsController({
    required this.titulos,
    required this.icones,
    required this.telas,
    required this.chave
  });

  void saveValue(bool chave, String key) async {
    switch (key) {
      case Keys.keyLimit : 
        Storage.save(Keys.keyLimit, chave);
      case Keys.keyRegisterRecords :
        Storage.save(Keys.keyRegisterRecords, chave);
    }
    
  }
}