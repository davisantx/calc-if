import 'package:flutter/material.dart';
import 'package:calc_if/settings/configuracoes.dart';
import 'package:calc_if/constant/keys.dart';
import 'package:calc_if/widgets/background.dart';
import 'package:calc_if/widgets/box_transparent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Temas extends StatefulWidget {
  const Temas({super.key});

  @override
  State<Temas> createState() => _TemasState();
}

class _TemasState extends State<Temas> {
  final PageController _controller = PageController (
    viewportFraction: 0.75,
    initialPage: ConfiguracoesApp.temaAtual,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void salvarTemaSelecionado(int indice) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temaAtual = prefs.setInt(Keys.temaEscolhido, indice);
    ConfiguracoesApp.temaAtual = indice;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      indice: ConfiguracoesApp.temaAtual,
      conteudo: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Temas'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: ConfiguracoesApp.temas.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.68,
                                child: BoxTransparent(
                                  conteudo: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.68,
                                    child: Background(
                                      indice: index,
                                      conteudo: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Caso o tema não seja aplicado de forma adequada, feche o app e abra novamente',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      salvarTemaSelecionado(_controller.page!.round());
                                    });
                                  },
                                  child: const Text('Selecionar tema'),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}