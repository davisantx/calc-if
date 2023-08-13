import 'package:flutter/material.dart';
import 'package:calc_if/constant/keys.dart';
import 'package:calc_if/settings/configuracoes.dart';
import 'package:calc_if/views/configuracoes.dart';
import 'package:calc_if/widgets/cards/media_af.dart';
import 'package:calc_if/widgets/cards/media_final.dart';
import 'package:calc_if/widgets/cards/media_n1.dart';
import 'package:calc_if/widgets/cards/media_n2.dart';
import 'package:calc_if/widgets/cards/novo_calculo.dart';
import 'package:calc_if/widgets/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Principal extends StatefulWidget {
  Principal({super.key});
  int paginaAtual = 0;
  // static void t(int controllerPage) {
  //   paginaAtual = controllerPage + 1;
  // }

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _temaAtual = 0;

  @override
  void initState() {
    super.initState();
    lerDadosSalvos();
  }

  Future<int?> lerTemaAtual() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temaAtual = prefs.getInt(Keys.temaEscolhido);
    ConfiguracoesApp.temaAtual = temaAtual ?? 0;
    return temaAtual;
  }

  lerDadosSalvos() async {
    _temaAtual = await lerTemaAtual().then((value) => value ?? 0);
    setState(() {});
  }

  final List<Widget> boxes = const <Widget>[
    MediaN1(),
    MediaN2(),
    MediaFinal(),
    MediaAf(),
    NovoCalculo()
  ];

  final PageController _controller = PageController(
    viewportFraction: 0.83,
    initialPage: 0,
  );

  

  void trocarPaginaAposDelay() {
    if (_controller.page!.round() < boxes.length) {
      Future.delayed(
        const Duration(seconds: 2), 
        () {
         // widget.t(_controller.page!.round());
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // int paginaAtual = _controller.page!.round();
    return Background(
      indice: _temaAtual,
      conteudo: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 150,
        centerTitle: false,
       title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text(
                'CalcIF',
              style: TextStyle(
                fontSize: 38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: RichText(
                text: const TextSpan(
                    text:
                        'Uma maneira simples e rápida de calcular suas notas!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ),
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: IconButton(
            icon: const Icon(Icons.settings),
            iconSize: 35.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Configuracoes()
                )
              );
            },
          ),
        ),
      ],
    ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: ConfiguracoesApp.temas.length,
                  itemBuilder: (context, index) {
                    return boxes[index];
                  }
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
