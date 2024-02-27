import 'package:calc_if/src/home/controllers/mixins/media_com_pesos_mixin.dart';
import 'package:calc_if/src/app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaComPesos extends StatefulWidget {

  const BoxMediaComPesos({
    super.key,
  });

  @override
  State<BoxMediaComPesos> createState() => _BoxMediaComPesosState();
}

class _BoxMediaComPesosState extends State<BoxMediaComPesos> with MediaComPesosMixin {
  @override
  Widget build(BuildContext context) {
    return BoxWidget.withFourFields(
      formKey: formKey,
      title: 'Calcule com pesos',
      field1: field1,
      field2: field2,
      field3: pesoField1,
      field4: pesoField2,
      action: note.calcularMediaComPesos,
    );
  }
}