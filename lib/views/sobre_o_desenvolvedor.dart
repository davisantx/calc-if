import 'package:flutter/material.dart';
import 'package:calc_if/constant/desenvolvedor.dart';
import 'package:calc_if/settings/configuracoes.dart';
import 'package:calc_if/widgets/background.dart';
import 'package:calc_if/widgets/box_redes_sociais.dart';

class SobreODesenvolvedor extends StatelessWidget {
  const SobreODesenvolvedor({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      indice: ConfiguracoesApp.temaAtual,
      conteudo: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width <= 385
                      ? MediaQuery.sizeOf(context).width * 0.9
                      : MediaQuery.sizeOf(context).width <= 460 
                      ? MediaQuery.sizeOf(context).width * 0.85
                      : MediaQuery.sizeOf(context).width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                              Desenvolvedor.fotoDePerfil,
                            ),
                          ),
                          radius: 65,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              Desenvolvedor.username,
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            const Text('Aluno do IFCE')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 70.0,
                ),
                child: BoxRedesSociais(
                  nomeDaRedeSocial: 'Github',
                  logoDaRedeSocial: 'assets/img/logos/logo_git.png',
                  fotoDePerfil: Desenvolvedor.fotoDePerfil,
                  username: Desenvolvedor.username,
                )
              ),
              BoxRedesSociais(
                nomeDaRedeSocial: 'Instagram',
                logoDaRedeSocial: 'assets/img/logos/logo_instagram.webp',
                fotoDePerfil: Desenvolvedor.fotoDePerfil,
                username: Desenvolvedor.username,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
