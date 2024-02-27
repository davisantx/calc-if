import 'package:calc_if/src/app/utils/themes_page_utils.dart';
import 'package:calc_if/src/themes/controllers/themes_controller.dart';
import 'package:calc_if/src/themes/repository/themes_repository.dart' as themes_repository;

class ThemesPage extends StatefulWidget {
  const ThemesPage({super.key});

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> with ThemesController {
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
                  controller: pageController,
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
