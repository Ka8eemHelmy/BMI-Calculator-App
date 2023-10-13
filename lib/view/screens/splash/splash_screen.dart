import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi/view_model/utils/images.dart';
import 'package:flutter/material.dart';
import '../todo/home/home_screen.dart';
// import 'package:page_transition/src/enum.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AppImages.logo,
      nextScreen: HomeScreen(),
      splashIconSize: 150,
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.rotate,
    );
  }
}
