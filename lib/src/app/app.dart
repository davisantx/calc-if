import 'package:calc_if/src/home/ui/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalcIF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS : CupertinoPageTransitionsBuilder(),
            TargetPlatform.android : CupertinoPageTransitionsBuilder()
          }
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
