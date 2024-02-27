import 'package:calc_if/constants/developer.dart';
import 'package:calc_if/src/about/ui/widgets/box_border_widget.dart';
import 'package:calc_if/src/about/ui/widgets/box_social_media_widget.dart';
import 'package:flutter/material.dart';

class AboutDeveloperSubPage extends StatefulWidget {
  const AboutDeveloperSubPage({super.key});

  @override
  State<AboutDeveloperSubPage> createState() => _AboutDeveloperSubPageState();
}

class _AboutDeveloperSubPageState extends State<AboutDeveloperSubPage> {
  bool reverse = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: reverse,
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width <= 385
                  ? MediaQuery.sizeOf(context).width * 0.9
                  : MediaQuery.sizeOf(context).width <= 460
                      ? MediaQuery.sizeOf(context).width * 0.85
                      : MediaQuery.sizeOf(context).width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        Developer.enderecoFotoDePerfil,
                        filterQuality: FilterQuality.high,
                      )
                    ),
                    radius: 65,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          Developer.username,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text('Ex-aluno do IFCE')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
               top: 40.0,
            ),
            child: BoxSocialMediaWidget(
              nameOfSocialMedia: 'Github',
              imageOfSocialMedia: 'assets/img/logos/logo_git.png',
              profilePicture: Developer.enderecoFotoDePerfil,
              username: Developer.username,
              url: 'https://github.com/davisantx',
            )
          ),
          BoxSocialMediaWidget(
            nameOfSocialMedia: 'Instagram',
            imageOfSocialMedia: 'assets/img/logos/logo_instagram.webp',
            profilePicture: Developer.enderecoFotoDePerfil,
            username: Developer.username,
            url: 'https://www.instagram.com/davisantx/',
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    reverse = !reverse;
                    visible = !visible;
                  });
                },
                icon: visible
                    ? const Icon(Icons.arrow_drop_down)
                    : const Icon(Icons.arrow_drop_up)
            ),
              Visibility(
                visible: visible,
                child: const SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      BoxBorderWidget(
                        title: 'Esse app foi desenvolvido de forma independente e não possui quaisquer relações com o IF.',
                      ),
                    ]
                  ),
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }
}