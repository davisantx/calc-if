import 'package:calc_if/src/home/controllers/home_controller.dart';
import 'package:calc_if/src/home/controllers/note_controller.dart';
import 'package:calc_if/src/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaN2 extends StatefulWidget {
  const BoxMediaN2({super.key});

  @override
  State<BoxMediaN2> createState() => _BoxMediaN2State();
}

class _BoxMediaN2State extends State<BoxMediaN2> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController notaN21Controller = TextEditingController();

  final TextEditingController notaN22Controller = TextEditingController();

  final NoteController nota = NoteController();

  final HomeController _homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return BoxWidget(
      formKey: formKey,
      title: 'Calcule a média da N2',
      nameField1: 'Nota da N2.1',
      nameField2: 'Nota da N2.2',
      nota1: nota.notaN11,
      nota2: nota.notaN12,
      controllerField1: notaN21Controller,
      controllerField2: notaN22Controller,
      action: nota.calcularMediaN2,
      onSavedField1: (value) {
        nota.notaN21 = double.parse(value!);
      },
      onSavedField2: (value) {
        nota.notaN22 = double.parse(value!);
      },
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          _homeController.makeRecord(
            titleBox: 'Média da N2', 
            note: nota.calcularMediaN2(), 
            methodCalc: '(Nota da N2.1 + Nota da N2.2) / 2',
            calc: '(${nota.notaN21} + ${nota.notaN22}) / 2'
          );
          setState(() {});
        }
      }
    );
  }
}