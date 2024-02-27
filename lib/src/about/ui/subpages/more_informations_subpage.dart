import 'package:calc_if/constants/class.dart';
import 'package:calc_if/constants/hero/tags_hero.dart';
import 'package:calc_if/src/about/ui/class/about_class_page.dart';
import 'package:calc_if/src/about/ui/widgets/box_border_widget.dart';
import 'package:calc_if/src/app/navigator/navigator_app.dart';
import 'package:calc_if/src/app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class MoreInformationsSubPage extends StatelessWidget {
  const MoreInformationsSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height - 56 - 10 - MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              const BoxBorderWidget(
                title: 'O app foi desenvolvido por um ex-aluno da turma de 2021.1 do curso técnico integrado em informática do IFCE Campus Itapipoca!'
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
                child: Hero(
                  tag: HeroTags.textMaisInformacoes,
                  child: Text(
                    'Mais sobre a turma de informática 2021.1 do IFCE Campus Itapipoca',
                    style: TextStyle(fontSize: 21)
                  ),
                ),
              ),
               Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 150,
                        child: GestureDetector(
                          onTap: () {
                            NavigatorApp.navigatorTo(context, const AboutClassPage());
                          },
                          child: ClipOval(
                            child: Hero(
                              tag: HeroTags.imageClass, 
                              child: Image.asset(Class.img1)
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ButtonWidget(
                          action: () {
                            NavigatorApp.navigatorTo(context, const AboutClassPage());
                          },
                          text: 'Ver mais'
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
