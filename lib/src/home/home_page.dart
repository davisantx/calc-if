import 'package:calc_if/src/home/widgets/boxes/box_media_af.dart';
import 'package:calc_if/src/home/widgets/boxes/box_media_com_pesos.dart';
import 'package:calc_if/src/home/widgets/boxes/box_media_final.dart';
import 'package:calc_if/src/home/widgets/boxes/box_media_n1.dart';
import 'package:calc_if/src/home/widgets/boxes/box_media_n2.dart';
import 'package:calc_if/src/home/widgets/icon_widget.dart';
import 'package:calc_if/src/records/records_page.dart';

import 'package:calc_if/src/app/settings_app.dart';
import 'package:flutter/material.dart';
import 'package:calc_if/src/settings/settings_page.dart';
import 'package:calc_if/src/widgets/background_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final List<Widget> boxes = const <Widget>[
    BoxMediaN1(),
    BoxMediaN2(),
    BoxMediaFinal(),
    BoxMediaAf(),
    BoxMediaComPesos()
  ];

  final PageController _controller = PageController(
    viewportFraction: 0.83,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Background(
      index: SettingsApp.settingsAppInstance.getTheme(),
      content: Scaffold(
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
                      text: 'Uma maneira simples e rápida de calcular suas notas!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  IconWidget(
                    icon: Icons.receipt_long, 
                    screenNavigator: RecordsPage()
                  ),
                  IconWidget(
                    icon: Icons.settings, 
                    screenNavigator:  SettingsPage()
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: MediaQuery.sizeOf(context).height > 760 ? const EdgeInsets.only(top: 20) : const EdgeInsets.all(0),
                child: SizedBox(
                  height: 600,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: boxes.length,
                    itemBuilder: (context, index) {
                      return boxes[index];
                    }
                  ),
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