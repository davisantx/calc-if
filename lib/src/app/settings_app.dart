import 'package:flutter/material.dart';

class SettingsApp with ChangeNotifier {
  static late bool limitarCasasDecimais;
  static late int temaAtual;
  static late bool registrarRegistros;
  static late List listaDeRegistros;
  
  static late SettingsApp _settingsAppInstance; // Referência global à instância do provider

  static SettingsApp get settingsAppInstance => _settingsAppInstance;

  SettingsApp() {
    _settingsAppInstance = this;
  }
  void changeTheme(index) {
    temaAtual = index;
    notifyListeners();
  }

  int getTheme() {
    return temaAtual;
  }
}
