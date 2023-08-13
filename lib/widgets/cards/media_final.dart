import 'package:flutter/material.dart';
import 'package:calc_if/controllers/notas.dart';
import 'package:calc_if/widgets/box.dart';

class MediaFinal extends StatefulWidget {
  const MediaFinal({super.key});

  @override
  State<MediaFinal> createState() => _MediaFinalState();
}

class _MediaFinalState extends State<MediaFinal> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mediaN1Controller = TextEditingController();

  final TextEditingController mediaN2Controller = TextEditingController();

  final Notas nota = Notas();

  @override
  Widget build(BuildContext context) {
    return Box(
        formKey: formKey,
        titulo: 'Calcule a média final',
        nomeDoPrimeiroCampo: 'Média da N1',
        nomeDoSegundoCampo: 'Média da N2',
        nota1: nota.notaN11!,
        nota2: nota.notaN12!,
        primeiroCampoController: mediaN1Controller,
        segundoCampoController: mediaN2Controller,
        acao: nota.calcularMediaFinal(),
        onSavedCampo1: (value) {
          nota.notaN11 = double.parse(value!);
          nota.notaN12 = double.parse(value!);
        },
        onSavedCampo2: (value) {
          nota.notaN21 = double.parse(value!);
          nota.notaN22 = double.parse(value!);
        },
        onPressed: () {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            formKey.currentState!.save();
            setState(() {});
          }
          
        });
  }
}
