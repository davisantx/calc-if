import 'package:calc_if/src/app/utils/mixin_media_utils.dart';

mixin DisposerMixin {
  void startDispose(List<FieldModel?> fields) {
    for(var i = 0; i < fields.length; ++i) {
      if(fields[i] != null) {
        fields[i]!.textFieldModel.controller.dispose();
        fields[i]!.textFieldModel.focusNode.dispose();
      }
    }
  }   
}