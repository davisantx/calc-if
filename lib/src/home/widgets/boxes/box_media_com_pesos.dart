import 'package:calc_if/src/home/controllers/home_controller.dart';
import 'package:calc_if/src/home/controllers/note_controller.dart';
import 'package:calc_if/src/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaComPesos extends StatefulWidget {
  const BoxMediaComPesos({super.key});

  @override
  State<BoxMediaComPesos> createState() => _BoxMediaComPesosState();
}

class _BoxMediaComPesosState extends State<BoxMediaComPesos> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nota1Controller = TextEditingController();

  final TextEditingController nota2Controller = TextEditingController();

  final TextEditingController peso1Controller = TextEditingController();

  final TextEditingController peso2Controller = TextEditingController();

  final NoteController nota = NoteController();

  final HomeController _homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return BoxWidget.withFourFields(
      formKey: formKey,
      title: 'Calcule com pesos',
      nameField1: 'Nota 1',
      nameField2: 'Nota 2',
      nameField3: 'Peso 1',
      nameField4: 'Peso 2',
      nota1: nota.nota1,
      nota2: nota.nota2,
      peso1: nota.peso1,
      peso2: nota.peso2,
      controllerField1: nota1Controller,
      controllerField2: nota2Controller,
      controllerField3: peso1Controller,
      controllerField4: peso2Controller,
      action: nota.calcularMediaComPesos,
      onSavedField1: (value) {
        nota.nota1 = double.parse(value ?? '0');
      },
      onSavedField2: (value) {
        nota.nota2 = double.parse(value ?? '0');
      },
      onSavedField3: (value) {
        nota.peso1 = double.parse(value ?? '1');
      },
      onSavedField4: (value) {
        nota.peso2 = double.parse(value ?? '1');
      },
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          _homeController.makeRecord(
            titleBox: 'Média com pesos', 
            note: nota.calcularMediaComPesos(),
            methodCalc: '((Nota1 * Peso1) + (Nota2 * Peso2)) / (Peso1 + Peso2)',
            calc: '((${nota.nota1} * ${nota.peso1}) + (${nota.nota2} * ${nota.peso2})) / (${nota.peso1} + ${nota.peso2})'
          );
          setState(() {});
        }
      }
    );
  }
}