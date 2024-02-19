import 'package:calc_if/src/home/controllers/home_controller.dart';
import 'package:calc_if/src/home/controllers/note_controller.dart';
import 'package:calc_if/src/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaFinal extends StatefulWidget {
  const BoxMediaFinal({super.key});

  @override
  State<BoxMediaFinal> createState() => _BoxMediaFinalState();
}

class _BoxMediaFinalState extends State<BoxMediaFinal> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mediaN1Controller = TextEditingController();

  final TextEditingController mediaN2Controller = TextEditingController();

  final NoteController nota = NoteController();

  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return BoxWidget(
      formKey: formKey,
      title: 'Calcule a média final',
      nameField1: 'Média da N1',
      nameField2: 'Média da N2',
      nota1: nota.nota1MF,
      nota2: nota.nota2MF,
      controllerField1: mediaN1Controller,
      controllerField2: mediaN2Controller,
      action: nota.calcularMediaFinal,
      onSavedField1: (value) {
        nota.nota1MF = double.parse(value!);
      },
      onSavedField2: (value) {
        nota.nota2MF = double.parse(value!);
      },
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          _homeController.makeRecord(
            titleBox: 'Média final', 
            note :nota.calcularMediaFinal(),
            methodCalc: "((Média da N1 * 2)  + (Média da N2 * 3)) / 5", 
            calc: "((${nota.notaN11} * 2)  + (${nota.notaN12} * 3)) / 5"
          );
          setState(() {});
        }
      }
    );
  }
}