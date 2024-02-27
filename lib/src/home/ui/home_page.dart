import 'package:calc_if/src/app/utils/home_page_utils.dart';
import 'package:calc_if/src/home/controllers/home_controller.dart';

class HomePage extends StatelessWidget with HomeController {
  HomePage({
    super.key,
  });

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
                    screenNavigator: SettingsPage()
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
                    controller: controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: boxes.length,
                    itemBuilder: (context, index) {
                      onPageChanged();
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