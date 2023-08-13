import 'package:flutter/material.dart';
import 'package:calc_if/controllers/notas.dart';
import 'package:calc_if/widgets/box.dart';

class MediaAf extends StatefulWidget {
  const MediaAf({super.key});

  @override
  State<MediaAf> createState() => _MediaAfState();
}

class _MediaAfState extends State<MediaAf> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mediaFinalController = TextEditingController();

  final TextEditingController notaDaAfController = TextEditingController();

  final Notas nota = Notas();
  @override
  Widget build(BuildContext context) {
    return Box(
        formKey: formKey,
        titulo: 'Calcule a média da AF',
        nomeDoPrimeiroCampo: 'Média final',
        nomeDoSegundoCampo: 'Nota da AF',
        nota1: nota.notaN11!,
        nota2: nota.notaN12!,
        primeiroCampoController: mediaFinalController,
        segundoCampoController: notaDaAfController,
        acao: nota.calcularMediaAF(),
        onSavedCampo1: (value) {
          nota.mediaFinal = double.parse(value!);
        },
        onSavedCampo2: (value) {
          nota.notaAF = double.parse(value!);
        },
        onPressed: () {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            formKey.currentState!.save();
            
            setState(() {});
          }
        }
      );
  }
}
