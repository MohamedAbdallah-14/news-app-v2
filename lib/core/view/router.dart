import 'package:flutter/material.dart';
import 'package:news_app/splash/view/splash_screen.dart';

class AppRouter {
  AppRouter._();
  static Route<Widget> onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}
