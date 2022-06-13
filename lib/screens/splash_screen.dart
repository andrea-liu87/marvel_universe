import 'package:flutter/material.dart';
import 'package:marvel_universe/constants/route_name.dart';
import 'package:marvel_universe/widgets/background_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  
  void navigateToMain(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, RouteName.mainScreen);
  }

  @override
  Widget build(BuildContext context) {
    navigateToMain(context);
    return const Scaffold(
      body: BackgroundImage(),);
  }
}
