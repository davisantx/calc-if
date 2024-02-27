import 'package:calc_if/src/app/widgets/box_transparent.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class BoxSocialMediaWidget extends StatelessWidget {
  final String nameOfSocialMedia;
  final String imageOfSocialMedia;
  final String profilePicture;
  final String username;
  final String url;
  final bool isCustomHeight;
  final double height;

  const BoxSocialMediaWidget({
    super.key,
    required this.nameOfSocialMedia,
    required this.imageOfSocialMedia,
    required this.profilePicture,
    required this.username,
    required this.url,
  }) : this.isCustomHeight = false, this.height = 0;

  const BoxSocialMediaWidget.customHeight({
    super.key,
    required this.nameOfSocialMedia,
    required this.imageOfSocialMedia,
    required this.profilePicture,
    required this.username,
    required this.url,
    required this.height,
  }) : this.isCustomHeight = true;

  _openUrl(BuildContext context) async {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Deseja ser redirecionado para página?'),
          content: Text('Você será redirecionado para ${this.url}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Não')
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(this.url);
                  if (!await launchUrl(url)) {
                    throw Exception('Não foi possível iniciar $url');
                  }
                Navigator.pop(context);
              },
              child: const Text('Sim')
            )
            ],
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: BoxTransparent(
          content: SizedBox(
              width: MediaQuery.sizeOf(context).width <= 385
                  ? MediaQuery.sizeOf(context).width * 0.93
                  : MediaQuery.sizeOf(context).width <= 460
                      ? MediaQuery.sizeOf(context).width * 0.9
                      : MediaQuery.sizeOf(context).width * 0.85,
              height: isCustomHeight ? 220 : null,
              child: InkWell(
                onTap: () {
                  _openUrl(context);

                },
                borderRadius: BorderRadius.all(Radius.circular(30)),
        child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.asset(
                                imageOfSocialMedia,
                              ),
                            ),
                            radius: 18.5,
                          ),
                        ),
                        Text(nameOfSocialMedia,
                            style: const TextStyle(
                              fontSize: 21,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 7.0,
                        left: 2.0,
                        right: 2.0,
                      ),
                      child: BoxTransparent(
                        content: Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                    child: Image.asset(
                                  profilePicture,
                                  filterQuality: FilterQuality.high,
                                )),
                                radius: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '@$username',
                                  style: const TextStyle(fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
