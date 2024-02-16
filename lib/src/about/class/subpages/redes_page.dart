import 'package:calc_if/constants/class.dart';
import 'package:calc_if/src/about/widgets/box_social_media_widget.dart';
import 'package:calc_if/src/widgets/modal_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class RedesClassPage extends StatelessWidget {
  const RedesClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheetWithHeaderWidget(
      titleHeader: 'Redes sociais',
      content: [
        Center(
          child: BoxSocialMediaWidget.customHeight(
            nameOfSocialMedia: 'Instagram',
            imageOfSocialMedia: 'assets/img/logos/logo_instagram.webp',
            profilePicture: Class.img1,
            username: Class.socialMediaInstagram,
            url: 'https://www.instagram.com/informatica._2021/',
            height: 200,
          ),
        ),
      ],
    );
  }
}
