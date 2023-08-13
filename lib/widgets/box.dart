import 'package:calc_if/constant/keys.dart';
import 'package:calc_if/widgets/caixa_texto.dart';
import 'package:calc_if/widgets/botao.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Box extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String titulo;
  final String nomeDoPrimeiroCampo;
  final String nomeDoSegundoCampo;

  final TextEditingController primeiroCampoController;
  final TextEditingController segundoCampoController;
  final dynamic Function(String?) onSavedCampo1;
  final dynamic Function(String?) onSavedCampo2;
  double nota1;
  double nota2;
  double acao;
  void Function()? onPressed;

  Box({
    super.key,
    required this.formKey,
    required this.titulo,
    required this.nomeDoPrimeiroCampo,
    required this.nomeDoSegundoCampo,
    required this.primeiroCampoController,
    required this.segundoCampoController,
    required this.nota1,
    required this.nota2,
    required this.acao,
    required this.onPressed,
    required this.onSavedCampo1,
    required this.onSavedCampo2,
  });

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  bool limitarCasas = false;

  @override
  void initState() {
    super.initState();
    lerSeLimitarCasasDecimaisEstaAtivado();
  }

  @override
  void dispose() {
    widget.primeiroCampoController.dispose();
    widget.segundoCampoController.dispose();
    super.dispose();
  }

  void lerSeLimitarCasasDecimaisEstaAtivado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    limitarCasas = prefs.getBool(Keys.limitarCasasDecimais) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    lerSeLimitarCasasDecimaisEstaAtivado();
    return Form(
      key: widget.formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
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
                      offset: const Offset(8, 8)),
                  // BoxShadow(
                  //     color: Colors.grey.shade700,
                  //     blurRadius: 1,
                  //     spreadRadius: 0.1,
                  //     offset: Offset(-3, -3))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(
                    widget.titulo,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Center(
                      child: Text(
                        limitarCasas
                            ? widget.acao.toStringAsFixed(2)
                            : '${widget.acao}',
                        textScaleFactor: 1.8,
                      ),
                    ),
                  ),
                  CaixaTexto(
                    label: widget.nomeDoPrimeiroCampo,
                    controller: widget.primeiroCampoController,
                    focusNode: focusNode1,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(focusNode2);
                    },
                    largura: MediaQuery.sizeOf(context).width * 0.7,
                    onValidate: (value) {
                      return validar(value, context);
                    },
                    onSaved: widget.onSavedCampo1,
                  ),
                  CaixaTexto(
                    label: widget.nomeDoSegundoCampo,
                    controller: widget.segundoCampoController,
                    focusNode: focusNode2,
                    onFieldSubmitted: null,
                    largura: MediaQuery.sizeOf(context).width * 0.7,
                    onValidate: (value) {
                      return validar(value, context);
                    },
                    onSaved: widget.onSavedCampo2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Botao(
                      texto: 'Calcular',
                      acao: widget.onPressed,
                    ),
                  )
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
        return 'Valor inválido';
      } else {
        return null;
      }
    } else {
      return 'Campo vázio!';
    }
  }
}
