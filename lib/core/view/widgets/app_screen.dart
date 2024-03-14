import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.backgroundColor,
  });

  final Widget? child;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.background,
      appBar: appBar,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
