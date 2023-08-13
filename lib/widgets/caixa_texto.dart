import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaixaTexto extends StatelessWidget {
  final String label;
  final bool pass;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  double largura;
  final TextEditingController? controller;
  final String? Function(String?) onValidate;
  final Function(String?) onSaved;

  CaixaTexto({
    super.key,
    required this.label,
    this.pass = false,
    required this.controller, 
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.largura,
    required this.onValidate,
    required this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: null, 
            width: largura
          ),
          child: TextFormField(
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: 4,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter> [
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
