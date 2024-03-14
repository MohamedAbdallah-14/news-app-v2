import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/breakpoints.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : assert(
          mobile != null || tablet != null || desktop != null,
          'At least one of the widgets must be not null',
        );
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    if (BreakPoints.isDesktop(context) && desktop != null) {
      return desktop!;
    } else if (BreakPoints.isTablet(context) && tablet != null) {
      return tablet!;
    } else if (mobile != null) {
      return mobile!;
    }

    return Container();
  }
}
