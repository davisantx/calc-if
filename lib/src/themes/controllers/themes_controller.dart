import 'package:calc_if/src/app/utils/themes_page_utils.dart';

mixin ThemesController <T extends StatefulWidget> on State<T> {
  late final PageController pageController = PageController(
    viewportFraction: 0.75,
    initialPage: SettingsApp.temaAtual,
  );

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
  void salvarTemaSelecionado() async {
    await pageController.positions.isEmpty == false;
    Storage.save(Keys.theme, pageController.page!.round());
    SettingsApp.settingsAppInstance.changeTheme(pageController.page!.round());
    setState(() {});
  }
}