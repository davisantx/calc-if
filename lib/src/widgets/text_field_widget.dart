import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final bool pass;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  double width;
  final TextEditingController? controller;
  final String? Function(String?) onValidate;
  final Function(String?) onSaved;
  final bool isText;
  
  TextFieldWidget({
    super.key,
    required this.label,
    this.pass = false,
    required this.controller, 
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.width,
    required this.onValidate,
    required this.onSaved,
    this.isText = false
  });

  TextFieldWidget.text({
    super.key,
    required this.label,
    this.pass = false,
    required this.controller,
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.width,
    required this.onValidate,
    required this.onSaved,
    this.isText = true
  });

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
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: isText ? null : 4,
            keyboardType: isText ? TextInputType.text : TextInputType.number,
            inputFormatters: isText ? null : <TextInputFormatter> [
              FilteringTextInputFormatter.allow(RegExp(r'(?:\.|[0-9])*')),
            ],
            obscureText: pass,
            validator: onValidate,
            onSaved: onSaved,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              labelText: label,
            ),
          ),
        ),
      ),
    );
  }
}
