import 'package:flutter/material.dart';
import 'package:news_app/home/view/screen/home_screen.dart';

class HomeRouter {
  HomeRouter._();
  static Route<Widget>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
