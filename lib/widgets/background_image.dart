import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(colors: [
          Constants.kColorRedPrimary,
          Colors.red.withOpacity(0.7)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .createShader(bounds);
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/marvel_comic.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}