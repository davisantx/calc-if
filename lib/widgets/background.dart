import 'package:flutter/material.dart';
import 'package:calc_if/settings/configuracoes.dart';

class Background extends StatelessWidget {
  final Widget? conteudo;
  final int indice;
  const Background({
    super.key,
    required this.conteudo,
    required this.indice
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ConfiguracoesApp.temas[indice].decoracaoDoBackground,
      child: conteudo,
    );
  }
}

