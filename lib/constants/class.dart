import 'package:flutter/material.dart';

class Class {
  static const String img1 = 'assets/img/class/img_1.jpg';
  static const String socialMediaInstagram = 'informatica._2021';
  
  static List<String> projIntegrador = List<String>.generate(
    2, (index) => 'assets/img/class/proj_integ/img_${index + 1}.jpg'
  );
  // static List<Image> listImagesMural = List<Image>.generate(
  //   14, (index) => Image.asset(
  //     listEnderecoImagesMural[index], 
  //     filterQuality: FilterQuality.high, 
  //     height: double.infinity, 
  //     width: double.infinity
  //   )
  // );
  static List<String> listEnderecoImagesMural = List<String>.generate(
    14, (index) => 'assets/img/class/mural/img_${index + 1}.jpg'
  );
  static List<Image> listImagesMural = List<Image>.generate(
    14, (index) => Image.asset(
      listEnderecoImagesMural[index], 
      filterQuality: FilterQuality.high, 
      height: double.infinity, 
      width: double.infinity
    )
  );
}