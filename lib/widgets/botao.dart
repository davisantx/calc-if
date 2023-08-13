import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  
  final void Function()? acao;

   const Botao({
    super.key,
    required this.texto,
    required this.acao
  });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          width: 115,
          height: 40,
        ),
        child: ElevatedButton(
          onPressed: acao,
          child: Text(
            texto,
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
      ),
    );
  }
}
