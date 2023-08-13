import 'package:calc_if/views/principal.dart';
import 'package:flutter/material.dart';
import 'package:calc_if/controllers/notas.dart';
import 'package:calc_if/widgets/box.dart';

class MediaN1 extends StatefulWidget {
  const MediaN1({super.key});

  @override
  State<MediaN1> createState() => _MediaN1State();
}

class _MediaN1State extends State<MediaN1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController notaN11Controller = TextEditingController();

  final TextEditingController notaN12Controller = TextEditingController();

  final Notas nota = Notas();

  @override
  Widget build(BuildContext context) {
    return Box(
        formKey: formKey,
        titulo: 'Calcule a média da N1',
        nomeDoPrimeiroCampo: 'Nota da N1.1',
        nomeDoSegundoCampo: 'Nota da N1.2',
        nota1: nota.notaN11,
        nota2: nota.notaN12,
        primeiroCampoController: notaN11Controller,
        segundoCampoController: notaN12Controller,
        acao: nota.calcularMediaN1(),
        onSavedCampo1: (value) {
          nota.notaN11 = double.parse(value ?? '0');
        },
        onSavedCampo2: (value) {
          nota.notaN12 = double.parse(value ?? '0');
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
