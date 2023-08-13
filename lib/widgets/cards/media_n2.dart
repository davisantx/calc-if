import 'package:flutter/material.dart';
import 'package:calc_if/controllers/notas.dart';
import 'package:calc_if/widgets/box.dart';

class MediaN2 extends StatefulWidget {
  const MediaN2({super.key});

  @override
  State<MediaN2> createState() => _MediaN2State();
}

class _MediaN2State extends State<MediaN2> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController notaN21Controller = TextEditingController();

  final TextEditingController notaN22Controller = TextEditingController();

  final Notas nota = Notas();

  @override
  Widget build(BuildContext context) {
    return Box(
        formKey: formKey,
        titulo: 'Calcule a média da N2',
        nomeDoPrimeiroCampo: 'Nota da N2.1',
        nomeDoSegundoCampo: 'Nota da N2.2',
        nota1: nota.notaN11!,
        nota2: nota.notaN12!,
        primeiroCampoController: notaN21Controller,
        segundoCampoController: notaN22Controller,
        acao: nota.calcularMediaN2(),
        onSavedCampo1: (value) {
          nota.notaN21 = double.parse(value!);
        },
        onSavedCampo2: (value) {
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
