import 'package:calc_if/src/app/settings_app.dart';
import 'package:calc_if/src/widgets/text_field_widget.dart';
import 'package:calc_if/src/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class BoxWidget extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final String title;
  final String nameField1;
  final String nameField2;
  String? nameField3;
  String? nameField4;

  final TextEditingController controllerField1;
  final TextEditingController controllerField2;
  TextEditingController? controllerField3;
  TextEditingController? controllerField4;

  final dynamic Function(String?) onSavedField1;
  final dynamic Function(String?) onSavedField2;
  dynamic Function(String?)? onSavedField3;
  dynamic Function(String?)? onSavedField4;
  double nota1;
  double nota2;
  double? peso1;
  double? peso2;
  dynamic action;
  void Function()? onPressed;
  bool fourFields = false;

  BoxWidget({
    super.key,
    required this.formKey,
    required this.title,
    required this.nameField1,
    required this.nameField2,
    required this.controllerField1,
    required this.controllerField2,
    required this.nota1,
    required this.nota2,
    required this.action,
    required this.onPressed,
    required this.onSavedField1,
    required this.onSavedField2,
    this.fourFields = false,
  });

  BoxWidget.withFourFields({
    super.key,
    required this.formKey,
    required this.title,
    required this.nameField1,
    required this.nameField2,
    required this.nameField3,
    required this.nameField4,
    required this.controllerField1,
    required this.controllerField2,
    required this.controllerField3,
    required this.controllerField4,
    required this.nota1,
    required this.nota2,
    required this.peso1,
    required this.peso2,
    required this.action,
    required this.onPressed,
    required this.onSavedField1,
    required this.onSavedField2,
    required this.onSavedField3,
    required this.onSavedField4,
    this.fourFields = true,
  });

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode? focusNode3 = FocusNode();
  FocusNode? focusNode4 = FocusNode();
  @override
  void dispose() {
    widget.controllerField1.dispose();
    widget.controllerField2.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    if(widget.controllerField3 != null && widget.controllerField4 != null) {
      widget.controllerField3!.dispose();
      widget.controllerField4!.dispose();
    }
    if(focusNode3 != null && focusNode4 != null) {
      focusNode3!.dispose();
      focusNode4!.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Center(
        child: Padding(
          padding: MediaQuery.sizeOf(context).height > 550
              ? const EdgeInsets.only(top: 23, bottom: 17, right: 17, left: 17)
              : const EdgeInsets.all(17.0),
          child: Container(
            height: 535,
            width: MediaQuery.sizeOf(context).width * 0.8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              color: const Color.fromARGB(255, 190, 201, 255),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.shade700,
                  blurRadius: 1,
                  spreadRadius: 0.1,
                  offset: const Offset(8, 8)
                ),
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 26, 
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Center(
                      child: Text(
                        SettingsApp.limitarCasasDecimais 
                        ? '${widget.action().toStringAsFixed(2)}' 
                        : '${widget.action().toStringAsFixed(5)}',
                        style: const TextStyle(
                          fontSize: 25 // 1.8 scale factor
                        ),
                      ),
                    ),
                  ),
                  widget.fourFields
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFieldWidget(
                                  label: widget.nameField1,
                                  controller: widget.controllerField1,
                                  focusNode: focusNode1,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(focusNode2);
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.28,
                                  onValidate: (value) {
                                    return validar(value, context);
                                  },
                                  onSaved: widget.onSavedField1,
                                ),
                                TextFieldWidget(
                                  label: widget.nameField3!,
                                  controller: widget.controllerField3,
                                  focusNode: focusNode3!,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(focusNode4);
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.22,
                                  onValidate: (value) {
                                    return validar(value, context);
                                  },
                                  onSaved: widget.onSavedField3!,
                                ),
                            
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFieldWidget(
                                  label: widget.nameField2,
                                  controller: widget.controllerField2,
                                  focusNode: focusNode2,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(focusNode3);
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.28,
                                  onValidate: (value) {
                                    return validar(value, context);
                                  },
                                  onSaved: widget.onSavedField2,
                                ),
                                TextFieldWidget(
                                  label: widget.nameField4!,
                                  controller: widget.controllerField4,
                                  focusNode: focusNode4!,
                                  onFieldSubmitted: null,
                                  width: MediaQuery.sizeOf(context).width * 0.22,
                                  onValidate: (value) {
                                    return validar(value, context);
                                  },
                                  onSaved: widget.onSavedField4!,
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            TextFieldWidget(
                              label: widget.nameField1,
                              controller: widget.controllerField1,
                              focusNode: focusNode1,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(focusNode2);
                              },
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              onValidate: (value) {
                                return validar(value, context);
                              },
                              onSaved: widget.onSavedField1,
                            ),
                            TextFieldWidget(
                              label: widget.nameField2,
                              controller: widget.controllerField2,
                              focusNode: focusNode2,
                              onFieldSubmitted: null,
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              onValidate: (value) {
                                return validar(value, context);
                              },
                              onSaved: widget.onSavedField2,
                            )
                          ],
                        ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ButtonWidget(
                      text: 'Calcular',
                      action: () {
                        widget.onPressed!();
                      }
                    )
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validar(value, context) {
    if (!value.isEmpty) {
      double valor = double.parse(value!);
      if (valor > 10.0 || valor < 0.0) {
        return 'Inválido';
      } else {
        return null;
      }
    } else {
      return 'Vazio!';
    }
  }
}
