import 'package:calc_if/src/app/utils/mixin_media_utils.dart';
import 'package:calc_if/src/home/controllers/mixins/media_af_mixin.dart';
import 'package:calc_if/src/app/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BoxMediaAf extends StatefulWidget {
  
  const BoxMediaAf({
    super.key, 
  });

  @override
  State<BoxMediaAf> createState() => _BoxMediaAfState();
}

class _BoxMediaAfState extends State<BoxMediaAf> with MediaAfMixin {
  
  @override
  Widget build(BuildContext context) {
    return BoxWidget.withTwoFields(
      title: 'Calcule a média da AF',
      formKey: formKey,
      field1: field1,
      field2: field2,
      action: note.calcularMediaAF,
    );
  }
}