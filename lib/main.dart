import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:calc_if/src/app/app.dart';
import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:calc_if/storage/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  
  await Storage.start();

  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsApp(),
      child: const App(),
    )
  );
}