import 'package:flutter/material.dart';
import 'package:marvel_universe/constants/route_name.dart';
import 'package:marvel_universe/constants/app_routes.dart';
import 'package:marvel_universe/screens/splash_screen.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Constants.kThemeApp,
      initialRoute: RouteName.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
