import 'package:calc_if/src/settings/controllers/settings_controller.dart';
import 'package:calc_if/src/settings/ui/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:calc_if/src/app/widgets/background_widget.dart';
import 'package:calc_if/src/app/loaded/settings_app.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SettingsController {

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
                itemCount: titulos.length,
                padding: const EdgeInsets.all(9.0),
                itemBuilder: (context, index) {
                  return ItemWidget(
                    title: titulos[index],
                    icon: icones[index],
                    screen: telas[index],
                    trailing: telas[index] == null
                      ? Switch(
                          value: index == 1 
                          ?
                          SettingsApp.limitarCasasDecimais
                          : index == 2
                          ?
                          SettingsApp.registrarRegistros
                          :
                          SettingsApp.fixarBox
                          ,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            setState(() {
                              onChanged[index](value);
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
