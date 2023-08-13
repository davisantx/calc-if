import 'package:flutter/material.dart';
import 'package:calc_if/settings/configuracoes.dart';
import 'package:calc_if/widgets/background.dart';

class CriarCalculo extends StatelessWidget {
  const CriarCalculo({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        indice: ConfiguracoesApp.temaAtual,
        conteudo: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Esta funcionalidade ainda está em desenvolvimento...',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ), 
    );
  }
}