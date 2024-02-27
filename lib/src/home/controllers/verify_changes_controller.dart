import 'package:calc_if/src/app/utils/mixin_media_utils.dart';

class VerifyChanges {

  static verify({required GlobalKey<FormState> formKey}) {
    if(Validator.confirmValidation(formKey)) {
      formKey.currentState!.save();
    }
  }
}
