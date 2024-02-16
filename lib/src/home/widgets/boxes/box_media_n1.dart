import 'package:calc_if/src/home/controllers/home_controller.dart';
import 'package:calc_if/src/home/controllers/note_controller.dart';
import 'package:calc_if/src/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaN1 extends StatefulWidget {
  const BoxMediaN1({super.key});

  @override
  State<BoxMediaN1> createState() => _BoxMediaN1State();
}

class _BoxMediaN1State extends State<BoxMediaN1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController notaN11Controller = TextEditingController();

  final TextEditingController notaN12Controller = TextEditingController();

  final NoteController nota = NoteController();

  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return BoxWidget(
      formKey: formKey,
      title: 'Calcule a média da N1',
      nameField1: 'Nota da N1.1',
      nameField2: 'Nota da N1.2',
      nota1: nota.notaN11,
      nota2: nota.notaN12,
      controllerField1: notaN11Controller,
      controllerField2: notaN12Controller,
      action: nota.calcularMediaN1,
      onSavedField1: (value) {
        nota.notaN11 = double.parse(value ?? '0');
      },
      onSavedField2: (value) {
        nota.notaN12 = double.parse(value ?? '0');
      },
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          
          formKey.currentState!.save();
          _homeController.makeRecord(
            titleBox: 'Média da N1', 
            note: nota.calcularMediaN1(), 
            methodCalc: '(Nota da N1.1 + Nota da N1.2) / 2',
            calc: '(${nota.notaN11} + ${nota.notaN12}) / 2'
          );
          setState(() {});
        }
      }
    );
  }
}