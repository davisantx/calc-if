import 'package:calc_if/src/home/controllers/mixins/media_n1_mixin.dart';
import 'package:calc_if/src/app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaN1 extends StatefulWidget {
  
  const BoxMediaN1({
    super.key,
  });

  @override
  State<BoxMediaN1> createState() => _BoxMediaN1State();
}

class _BoxMediaN1State extends State<BoxMediaN1> with MediaN1Mixin {

  @override
  Widget build(BuildContext context) {
    return BoxWidget.withTwoFields(
      formKey: formKey,
      title: 'Calcule a média da N1',
      field1: field1,
      field2: field2,
      action: note.calcularMediaN1,
    );
  }
}