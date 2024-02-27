import 'package:calc_if/src/home/controllers/mixins/media_n2_mixin.dart';
import 'package:calc_if/src/app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaN2 extends StatefulWidget {
  
  const BoxMediaN2({
    super.key, 
  });

  @override
  State<BoxMediaN2> createState() => _BoxMediaN2State();
}

class _BoxMediaN2State extends State<BoxMediaN2> with MediaN2Mixin {
  @override
  Widget build(BuildContext context) {
    return BoxWidget.withTwoFields(
      formKey: formKey,
      title: 'Calcule a média da N2',
      field1: field1,
      field2: field2,
      action: note.calcularMediaN2,
    );
  }
}