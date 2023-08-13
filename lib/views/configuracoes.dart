import 'package:calc_if/controllers/configuracoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:calc_if/constant/keys.dart';
import 'package:calc_if/views/sobre_o_desenvolvedor.dart';
import 'package:calc_if/views/temas.dart';
import 'package:calc_if/widgets/background.dart';
import 'package:calc_if/widgets/itens_config.dart';
import 'package:calc_if/settings/configuracoes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  ConfiguracoesController configuracoesController = ConfiguracoesController();

 

  
  
  @override
  void initState() {
    super.initState();
    configuracoesController.lerValorDaChave();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Background(
      indice: ConfiguracoesApp.temaAtual,
      conteudo: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Configurações'),
          backgroundColor: Colors.transparent,
        ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
            itemCount: configuracoesController.configuracoesModel.titulos.length,
            itemBuilder: (context, index) {
              return Item(
                  titulo: configuracoesController.configuracoesModel.titulos[index],
                  icone: configuracoesController.configuracoesModel.icones[index],
                  trailing: index != 1
                      ? null
                      : Switch(
                          value: configuracoesController.configuracoesModel.chave,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            configuracoesController.configuracoesModel.chave = value;
                              ConfiguracoesApp.limitarCasasDecimais = configuracoesController.configuracoesModel.chave ?? false;
                            setState(() {
                              configuracoesController.salvarValorDaChave(configuracoesController.configuracoesModel.chave ?? false);
                            });
                          },
                        ),
                  tela: configuracoesController.configuracoesModel.telas[index]);
            },
            padding: const EdgeInsets.all(9.0),
          ),
        ),
      ),
    ));
  }

  
}
