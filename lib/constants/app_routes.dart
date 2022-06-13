import 'package:marvel_universe/constants/route_name.dart';
import 'package:marvel_universe/screens/homepage.dart';

import '../screens/splash_screen.dart';

class AppRoutes{
  static final routes = {
    RouteName.splashScreen : (context) => const SplashScreen(),
    RouteName.mainScreen : (context) => Homepage()
  };
}