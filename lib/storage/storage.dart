import 'package:calc_if/constants/keys.dart';
import 'package:calc_if/src/records/models/record_model.dart';
import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  static dynamic keyBoxFixed;
  static dynamic boxFixed;
  static dynamic keyLimit;
  static dynamic theme;
  static dynamic keyRegisterRecords;
  static dynamic records;

  static start() async {
    await Hive.initFlutter();

    if(!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(RecordModelAdapter());
    }

    SettingsApp();
    
    keyLimit = await Hive.openBox(Keys.keyLimit);
    theme = await Hive.openBox(Keys.theme);
    keyBoxFixed = await Hive.openBox<bool>(Keys.keyBoxFixed);
    boxFixed = await Hive.openBox<int>(Keys.boxFixed);
    keyRegisterRecords = await Hive.openBox(Keys.keyRegisterRecords);
    records = await Hive.openBox<List>(Keys.records);

    SettingsApp.boxFixado = boxFixed.get(Keys.boxFixed) ?? 0;
    SettingsApp.fixarBox = keyBoxFixed.get(Keys.keyBoxFixed) ?? true;
    SettingsApp.limitarCasasDecimais = keyLimit.get(Keys.keyLimit) ?? true;
    SettingsApp.temaAtual = theme.get(Keys.theme) ?? 0;
    SettingsApp.registrarRegistros = keyRegisterRecords.get(Keys.keyRegisterRecords) ?? true;
    SettingsApp.listaDeRegistros = records.get(Keys.records) ?? [];
  }

  static void cacheImages(BuildContext context, List<Image> list) {
    for(int i = 0; i < list.length; ++i) {
      precacheImage(list[i].image, context);
    }
  }

  static void save(String key, value) {
    switch (key) {
      case Keys.keyBoxFixed : keyBoxFixed.put(key, value);
      case Keys.boxFixed : boxFixed.put(key, value);
      case Keys.keyLimit : keyLimit.put(key, value);
      case Keys.theme : theme.put(key, value);
      case Keys.keyRegisterRecords : keyRegisterRecords.put(key, value);
      case Keys.records : records.put(key, value);
    }
  }

  static void getdata(String key) {
    switch (key) {
      case Keys.keyBoxFixed : return keyBoxFixed.get(key) ?? true;
      case Keys.boxFixed : return boxFixed.get(key) ?? 0;
      case Keys.keyLimit : return keyLimit.get(key) ?? true;
      case Keys.theme : return theme.get(key) ?? 0;
      case Keys.keyRegisterRecords : return keyRegisterRecords.get(key) ?? [];
      case Keys.records : return records.get(key) ?? [];
    }
  }
  static void delete(String key) {
    switch (key) {
      case Keys.keyBoxFixed : keyBoxFixed.delete(key);
      case Keys.boxFixed : boxFixed.delete(key);
      case Keys.keyLimit : keyLimit.delete(key);
      case Keys.theme : theme.delete(key);
      case Keys.keyRegisterRecords : keyRegisterRecords.delete(key);
      case Keys.records : records.delete(key);
    }
  }

  static load() {
    // 
  }

}