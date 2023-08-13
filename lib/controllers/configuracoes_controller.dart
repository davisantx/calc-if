import 'package:calc_if/constant/keys.dart';
import 'package:calc_if/models/configuracoes_model.dart';
import 'package:calc_if/views/sobre_o_desenvolvedor.dart';
import 'package:calc_if/views/temas.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesController {
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel(
    titulos: [
      'Temas',
      'Precisão das casas decimais',
      'Sobre o desenvolvedor'
    ],
    icones: [
      Icons.color_lens,
      Icons.percent_outlined,
      Icons.person
    ],
    telas: [
      const Temas(),
      null, 
      const SobreODesenvolvedor()
    ],
    chave: false
  );
  
  void lerValorDaChave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    configuracoesModel.chave = prefs.getBool(Keys.limitarCasasDecimais) ?? false;
  }
  void salvarValorDaChave(bool limitarCasasDecimais) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(Keys.limitarCasasDecimais, limitarCasasDecimais);
  }
}