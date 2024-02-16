import 'package:flutter/material.dart';
import 'package:calc_if/src/about/subpages/about_developer_widget.dart';
import 'package:calc_if/src/about/subpages/more_informations_widget.dart';
import 'package:calc_if/src/app/settings_app.dart';
import 'package:calc_if/src/widgets/background_widget.dart';

class AboutDeveloperPage extends StatefulWidget {
  const AboutDeveloperPage({super.key});

  @override
  State<AboutDeveloperPage> createState() => _AboutDeveloperPageState();
}

class _AboutDeveloperPageState extends State<AboutDeveloperPage> {
  late PageController _pageController;
  bool iconBack = false;

  final List<Widget> pages = const [
    AboutDeveloperWidget(), 
    MoreInformationsWidget()
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      index: SettingsApp.temaAtual,
      content: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (iconBack && _pageController.page! == 1) {
              setState(() {
                iconBack = !iconBack;
              });
              _pageController.animateToPage(0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
            } else if (iconBack == false && _pageController.page! == 0) {
              setState(() {
                iconBack = !iconBack;
              });
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
              }
            },
            child: iconBack
                ? const Icon(Icons.navigate_before_outlined)
                : const Icon(Icons.navigate_next_outlined),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return pages[index];
            }
        )
      ),
    );
  }
}