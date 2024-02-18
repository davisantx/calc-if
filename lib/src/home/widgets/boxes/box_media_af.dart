import 'package:calc_if/src/home/controllers/home_controller.dart';
import 'package:calc_if/src/home/controllers/note_controller.dart';
import 'package:calc_if/src/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaAf extends StatefulWidget {
  const BoxMediaAf({super.key});

  @override
  State<BoxMediaAf> createState() => _BoxMediaAfState();
}

class _BoxMediaAfState extends State<BoxMediaAf> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mediaFinalController = TextEditingController();

  final TextEditingController notaDaAfController = TextEditingController();

  final NoteController nota = NoteController();

  final HomeController _homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return BoxWidget(
      formKey: formKey,
      title: 'Calcule a média da AF',
      nameField1: 'Média final',
      nameField2: 'Nota da AF',
      nota1: nota.notaN11,
      nota2: nota.notaN12,
      controllerField1: mediaFinalController,
      controllerField2: notaDaAfController,
      action: nota.calcularMediaAF,
      onSavedField1: (value) {
        nota.mediaFinal = double.parse(value!);
      },
      onSavedField2: (value) {
        nota.notaAF = double.parse(value!);
      },
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          formKey.currentState!.save();
          _homeController.makeRecord(
            titleBox: 'Média da AF', 
            note: nota.calcularMediaAF(),
            methodCalc: "(Média final + Nota da AF) / 2",
            calc: "(${nota.mediaFinal} + ${nota.notaAF}) / 2"
          );
          setState(() {});
        }
      }
    );
  }
}