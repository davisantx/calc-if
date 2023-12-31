import 'package:calc_if/views/principal.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalcIF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: Principal(),
    );
  }
}
