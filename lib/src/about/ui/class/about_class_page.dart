import 'package:calc_if/constants/class.dart';
import 'package:calc_if/constants/hero/tags_hero.dart';
import 'package:calc_if/src/about/ui/class/subpages/mural_page.dart';
import 'package:calc_if/src/about/ui/class/subpages/projeto_page.dart';
import 'package:calc_if/src/about/ui/class/subpages/redes_page.dart';
import 'package:calc_if/src/app/navigator/navigator_app.dart';
import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:calc_if/src/app/widgets/background_widget.dart';
import 'package:calc_if/src/app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class AboutClassPage extends StatelessWidget {
  const AboutClassPage({super.key});

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Background(
        index: SettingsApp.temaAtual,
        content: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10, 
                  horizontal: 20
                ),
                child: SizedBox(
                  child: Column(
                    children: [
                      Hero(
                        flightShuttleBuilder: _flightShuttleBuilder,
                        tag: HeroTags.textMaisInformacoes,
                        child: const Text(
                          'Turma de informática 2021.1 do IFCE campus Itapipoca',
                          style: TextStyle(fontSize: 21)
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Hero(
                          tag: HeroTags.imageClass,
                            child: GestureDetector(
                              onTap: () {
                                NavigatorApp.navigatorTo(context, const MuralPage());
                              },
                              child: Image.asset(
                                Class.img1,
                                filterQuality: FilterQuality.high,
                              ),
                            )
                          )
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.09,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonWidget.customSize(
                            height: 40,
                            width: 100,
                            action: () {
                              NavigatorApp.navigatorTo(context, const MuralPage());
                            },
                            text: 'Mural'
                          ),
                          ButtonWidget.customSize(
                            height: 40,
                            width: 100,
                            action: () {
                              showModalBottomSheet(
                                constraints: BoxConstraints.tightFor(
                                  height: MediaQuery.of(context).size.height * 0.9
                                ),
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return ProjetoInPage();
                                },
                              );
                            },
                              text: 'Projeto'
                            ),
                            ButtonWidget.customSize(
                              height: 40,
                              width: 100,
                              action: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return Background.withBorder(
                                      index: SettingsApp.temaAtual,
                                      borderRadius: 20.0,
                                      content: const RedesClassPage()
                                    );
                                  },
                                );
                              },
                              text: 'Redes'
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
