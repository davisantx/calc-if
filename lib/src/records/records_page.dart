import 'package:calc_if/constants/keys.dart';
import 'package:calc_if/src/records/widgets/list_item_widget.dart';
import 'package:calc_if/src/app/settings_app.dart';
import 'package:calc_if/src/widgets/background_widget.dart';
import 'package:calc_if/storage/storage.dart';
import 'package:flutter/material.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {

  @override
  Widget build(BuildContext context) {
    var _list = SettingsApp.listaDeRegistros.reversed.toList();
    return Background(
      index: SettingsApp.temaAtual,
      content: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Registros'),
          actions: _list.isEmpty
            ? null
            : [
              IconButton(
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Deseja excluir todos os registros?'
                        ),
                        content: Text('Essa ação não poderá ser desfeita'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Voltar')
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                SettingsApp.listaDeRegistros = [];
                                Storage.delete(Keys.records);
                              });
                              Navigator.pop(context);
                                        
                            },
                            child: const Text('Excluir')
                          )
                        ],
                      );
                    }
                  );
                },
                icon: const Icon(Icons.playlist_remove)
              )
            ],
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height -
                56 -
                MediaQuery.of(context).padding.top,
            child: Center(
              child: SettingsApp.listaDeRegistros.isEmpty
                  ? const Text('Não há nenhum registro no momento!')
                  : ListView.builder(
                      padding: const EdgeInsets.all(9.0),
                      itemCount: SettingsApp.listaDeRegistros.length,
                      itemBuilder: (context, index) {
                        return ListItemWidget(
                          title: _list[index].titleBox,
                          methodCalc: _list[index].methodCalc,
                          calc: _list[index].calc,
                          dateTime: _list[index].dateTime,
                          nota: _list[index].note,
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

