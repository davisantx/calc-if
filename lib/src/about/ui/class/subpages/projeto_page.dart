import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:calc_if/constants/class.dart';
import 'package:calc_if/src/app/widgets/modal_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:calc_if/src/app/widgets/background_widget.dart';

class ProjetoInPage extends StatelessWidget {
  final _pageController = PageController(viewportFraction: 0.83);
  ProjetoInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      
      return Background.withBorder(
        index: SettingsApp.temaAtual,
        borderRadius: 20.0,
        content: ModalBottomSheetWithHeaderWidget(
          titleHeader: 'Projeto integrador',
          content: [
            Positioned(
              bottom: 20,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height > 760
                          ? constraints.maxHeight * 0.82
                          : constraints.maxHeight * 0.75,
                  width: MediaQuery.sizeOf(context).width,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          width: MediaQuery.sizeOf(context).width,
                          Class.projIntegrador[index]
                        ),
                      );
                    }
                  )
                ),
                ),
              )
            ]
          ),
      );
    });
  }
}
