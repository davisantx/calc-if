import 'package:calc_if/constants/keys.dart';
import 'package:calc_if/src/settings/controllers/settings_controller.dart';
import 'package:calc_if/src/settings/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:calc_if/src/about/about_developer_page.dart';
import 'package:calc_if/src/themes/themes_page.dart';
import 'package:calc_if/src/widgets/background_widget.dart';
import 'package:calc_if/src/app/settings_app.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsController _settingsController = SettingsController(
    titulos: [
      'Temas',
      'Precisão das casas decimais',
      'Salvar registros',
      'Sobre o desenvolvedor'
    ], 
    icones: [
      Icons.color_lens,
      Icons.percent_outlined,
      Icons.save_outlined,
      Icons.person
    ], 
    telas: [
      const ThemesPage(),
      null,
      null,
      const AboutDeveloperPage()
    ], 
    chave: false
  );

  @override
  Widget build(BuildContext context) {
    return Background(
      index: SettingsApp.settingsAppInstance.getTheme(),
      content: Scaffold(
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
                itemCount: _settingsController.titulos.length,
                padding: const EdgeInsets.all(9.0),
                itemBuilder: (context, index) {
                  return ItemWidget(
                    title: _settingsController.titulos[index],
                    icon: _settingsController.icones[index],
                    screen: _settingsController.telas[index],
                    trailing: index == 1
                      ? Switch(
                          value: SettingsApp.limitarCasasDecimais,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                           SettingsApp.limitarCasasDecimais = value;
                            setState(() {
                              _settingsController.saveValue(value, Keys.keyLimit);
                            });
                          },
                        )
                      : index == 2
                        ? Switch(
                            value: SettingsApp.registrarRegistros,
                            activeColor: Colors.red,
                            onChanged: (bool value) {
                              SettingsApp.registrarRegistros = value;
                              setState(() {
                                _settingsController.saveValue(
                                value, Keys.records);
                              });
                            },
                           )
                          : null
                      );
                    }
                  )
              ),
          ),
        )
      );
  }
}
