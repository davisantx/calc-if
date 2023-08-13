import 'package:flutter/material.dart';
import 'package:calc_if/models/tema.dart';

class ConfiguracoesApp {
  static bool limitarCasasDecimais = true;
  static int temaAtual = 1;

  static Tema temaPadrao = Tema(
    decoracaoDoBackground: const BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 189, 224, 221),
        Color.fromARGB(255, 167, 88, 167)
      ],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    )),
  );
  static Tema temaDevaneiosSupimpas = Tema(
      decoracaoDoBackground: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 0, 255, 234),
          Color.fromARGB(255, 179, 92, 179)
        ],
        stops: [0, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
  );

  static Tema temaTingidoDeVerde = Tema(
    decoracaoDoBackground: const BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 14, 212, 196),
        Color.fromARGB(255, 47, 207, 41)
      ],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    )),
  );
  
  static Tema temaPelicanosAoLuar = Tema(
    decoracaoDoBackground: const BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 255, 26, 26),
        Color.fromARGB(255, 255, 132, 255)
      ],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    )),
  );

  static Tema temaSobeALua = Tema(
    decoracaoDoBackground: const BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 170, 255, 234),
        Color.fromARGB(255, 255, 132, 255)
      ],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    )),
  );

  static List<Tema> temas = [
    temaPadrao,
    temaDevaneiosSupimpas,
    temaSobeALua,
    temaTingidoDeVerde,
    temaPelicanosAoLuar,
  ];
}
