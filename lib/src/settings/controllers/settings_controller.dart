import 'package:calc_if/constants/keys.dart';
import 'package:calc_if/src/about/about_developer_page.dart';
import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:calc_if/src/themes/ui/themes_page.dart';
import 'package:calc_if/storage/storage.dart';
import 'package:flutter/material.dart';

mixin SettingsController {
  List<String> titulos = [
    'Temas',
    'Precisão das casas decimais',
    'Salvar registros',
    'Fixar card automaticamente',
    'Sobre o desenvolvedor'
  ];
  List<IconData> icones = [
    Icons.color_lens,
    Icons.percent_outlined,
    Icons.save_outlined,
    Icons.fire_extinguisher,
    Icons.person
  ];
  List<dynamic> telas = [
    const ThemesPage(),
    null,
    null,
    null,
    const AboutDeveloperPage()
  ];

  List onChanged = [
    null,
    (value) {
      SettingsApp.limitarCasasDecimais = value; 
      Storage.save(Keys.keyLimit, SettingsApp.limitarCasasDecimais);
    },
    (value) {
      SettingsApp.registrarRegistros = value; 
      Storage.save(Keys.keyRegisterRecords, SettingsApp.registrarRegistros);
    },
    (value) {
      SettingsApp.fixarBox = value;
      if(SettingsApp.fixarBox) {
        Storage.save(Keys.keyBoxFixed, SettingsApp.fixarBox);
      }else {
        SettingsApp.boxFixado = 0;
        Storage.save(Keys.keyBoxFixed, SettingsApp.fixarBox);
        Storage.save(Keys.boxFixed, SettingsApp.boxFixado);
      }
    },
    null
  ];

}