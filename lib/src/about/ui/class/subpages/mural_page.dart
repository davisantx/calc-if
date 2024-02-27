import 'dart:math';
import 'package:calc_if/constants/class.dart';
import 'package:calc_if/src/app/loaded/settings_app.dart';
import 'package:calc_if/src/app/widgets/background_widget.dart';
import 'package:calc_if/storage/storage.dart';
import 'package:flutter/material.dart';

class MuralPage extends StatefulWidget {
  const MuralPage({super.key});

  @override
  State<MuralPage> createState() => _MuralPageState();
}

class _MuralPageState extends State<MuralPage> with TickerProviderStateMixin {
  late final AnimationController _animationControllers = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..animateTo(1);

  late final List<Animation<double>> _animations = List.generate(3, (index) => CurvedAnimation(
    parent: _animationControllers,
    curve: Curves.easeIn,
  ));

  late List<int> imagesPossibles;
  late List<int> images;

  @override
  void initState() {
    imagesPossibles = List.generate(Class.listEnderecoImagesMural.length, (index) => index);
    generateRandomImages();
    super.initState();
    repeatAnimation();
  }
  
  void generateRandomImages() {
    if(imagesPossibles.length < 3) {
      restart();
    }
    var img1 = imagesPossibles[Random().nextInt(imagesPossibles.length)];
    var img2 = imagesPossibles[Random().nextInt(imagesPossibles.length)];
    var img3 = imagesPossibles[Random().nextInt(imagesPossibles.length)];
    while (img2 == img1) {
      img2 = imagesPossibles[Random().nextInt(imagesPossibles.length)];
    }
    while (img3 == img1 || img3 == img2) {
      img3 = imagesPossibles[Random().nextInt(imagesPossibles.length)];
    }

    imagesPossibles.remove(img1);
    imagesPossibles.remove(img2);
    imagesPossibles.remove(img3);
    
    setState(() {
      images = [img1, img2, img3];
    });
    
  }
  void restart() {
    setState(() {
      imagesPossibles = List.generate(Class.listEnderecoImagesMural.length, (index) => index);
    });

  }
  void repeatAnimation() {
    if(mounted) {
       _animationControllers.animateTo(1);
      if(mounted) {
        Future.delayed(const Duration(seconds: 5), () {
          if(mounted) {
            _animationControllers.reverse();
          }
          if(mounted) {
            Future.delayed(const Duration(seconds: 1), () {
              if(mounted) {
                generateRandomImages();
                _animationControllers.repeat();
                repeatAnimation();
              }
            });
          }
        });
      }
    }
  }
  
  @override
  void didChangeDependencies() {
    Storage.cacheImages(context, Class.listImagesMural);
    super.didChangeDependencies();
    
  }

  @override
  void dispose() {
    _animationControllers.stop();
    _animationControllers.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Background(
        index: SettingsApp.temaAtual,
        content: Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent,),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                3, 
                (index) => Flexible(
                  flex: 1,
                  child: FadeTransition(
                    opacity: _animations[index],
                    child: Class.listImagesMural[images[index]],
                   )
                ),
              ), 
            ),
          )
        ),
      ),
    );
  }
}
