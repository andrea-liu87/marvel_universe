import 'package:flutter/material.dart';

class Constants{

  static final kThemeApp = ThemeData.dark().copyWith(
    primaryColor: kColorRedPrimary,
    accentColor: kColorYellow
  );

  static const Color kColorRedPrimary = Color(0xFFE71D22);
  static const Color kColorYellow = Color(0xFFFFC500);
}