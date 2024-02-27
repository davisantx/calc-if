import 'package:calc_if/src/home/controllers/mixins/media_final_mixin.dart';
import 'package:calc_if/src/app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaFinal extends StatefulWidget {
  
  const BoxMediaFinal({
    super.key,
  });

  @override
  State<BoxMediaFinal> createState() => _BoxMediaFinalState();
}

class _BoxMediaFinalState extends State<BoxMediaFinal> with MediaFinalMixin {

  @override
  Widget build(BuildContext context) {
    return BoxWidget.withTwoFields(
      formKey: formKey,
      title: 'Calcule a média final',
      field1: field1,
      field2: field2,
      action: note.calcularMediaFinal,
    );
  }
}