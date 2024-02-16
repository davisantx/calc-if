import 'package:calc_if/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:calc_if/src/app/settings_app.dart';
import 'package:calc_if/constants/keys.dart';
import 'package:calc_if/src/widgets/background_widget.dart';
import 'package:calc_if/src/widgets/box_transparent.dart';
import 'package:calc_if/src/themes/repository/themes_repository.dart' as themes_repository;

class ThemesPage extends StatefulWidget {
  const ThemesPage({super.key});

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.75,
      initialPage: SettingsApp.temaAtual,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void salvarTemaSelecionado() async {
    await _controller.positions.isEmpty == false;
    Storage.save(Keys.theme, _controller.page!.round());
    SettingsApp.settingsAppInstance.changeTheme(_controller.page!.round());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      index: SettingsApp.settingsAppInstance.getTheme(),
      content: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Temas', 
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: (MediaQuery.sizeOf(context).height - AppBar().preferredSize.height) * 0.9,
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: themes_repository.themes.length,
                  itemBuilder: (context, index) {
                    salvarTemaSelecionado();
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 16.0),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        child: BoxTransparent(
                          content: SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            child: Background.demonstrative(
                              index: index, content: null
                            ),
                          ),
                        ),
                      ),
                    );
                    },
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
