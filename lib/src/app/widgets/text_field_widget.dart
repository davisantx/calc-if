import 'package:calc_if/src/app/utils/mixin_media_utils.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final double width;
  final FieldModel field;
  final onFieldSubmitted;
  final bool isText;
  
  TextFieldWidget.number({
    super.key,
    required this.field,
    required this.width,
    required this.onFieldSubmitted
  }) : this.isText = false;

  TextFieldWidget.text({
    super.key,
    required this.field,
    required this.width,
    required this.onFieldSubmitted
  }) : this.isText = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: null, 
            width: width
          ),
          child: TextFormField(
            focusNode: field.textFieldModel.focusNode,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: isText ? null : 4,
            keyboardType: isText ? TextInputType.text : TextInputType.number,
            inputFormatters: isText ? null : <TextInputFormatter> [
              FilteringTextInputFormatter.allow(RegExp(r'(?:\.|[0-9])*')),
            ],
            validator: field.textFieldModel.onValidate,
            onSaved: field.textFieldModel.onSaved,
            onChanged: field.textFieldModel.onChanged,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              labelText: field.title,
            ),
          ),
        ),
      ),
    );
  }
}
