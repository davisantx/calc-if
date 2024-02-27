import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:calc_if/src/app/models/field_model.dart';
import 'package:calc_if/src/app/widgets/mixin/disposer_mixin.dart';
import 'package:calc_if/src/app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class BoxWidget extends StatefulWidget {
  final String title;
  final GlobalKey<FormState>? formKey;
  final FieldModel field1;
  final FieldModel field2;

  final FieldModel? field3;
  final FieldModel? field4;
  final dynamic action;

  const BoxWidget.withTwoFields({
    super.key,
    required this.title,
    required this.formKey,
    required this.field1,
    required this.field2,
    required this.action,
  }) : this.field3 = null, this.field4 = null;

  const BoxWidget.withFourFields({
    super.key,
    required this.formKey,
    required this.title,
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field4,
    required this.action,
  });

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> with DisposerMixin {
  @override
  void dispose() {
    startDispose([
      widget.field1, widget.field2, widget.field3, widget.field4
    ]);
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
                  widget.field3 != null && widget.field4 != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFieldWidget.number(
                                  field: widget.field1,
                                  width: MediaQuery.sizeOf(context).width * 0.28,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(widget.field2.textFieldModel.focusNode);
                                  },
                                ),
                                TextFieldWidget.number(
                                  field: widget.field3!,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(widget.field4!.textFieldModel.focusNode);
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.22,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFieldWidget.number(
                                  field: widget.field2,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(widget.field3!.textFieldModel.focusNode);
                                  },
                                  width: MediaQuery.sizeOf(context).width * 0.28,
                                ),
                                TextFieldWidget.number(
                                  field: widget.field4!,
                                  width: MediaQuery.sizeOf(context).width * 0.22,
                                  onFieldSubmitted: null,
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            TextFieldWidget.number(
                              field: widget.field1,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(widget.field2.textFieldModel.focusNode);
                              },
                              width: MediaQuery.sizeOf(context).width * 0.7,
                            ),
                            TextFieldWidget.number(
                              field: widget.field2,
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              onFieldSubmitted: null,
                            )
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
