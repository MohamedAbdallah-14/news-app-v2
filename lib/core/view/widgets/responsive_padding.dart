import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/breakpoints.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    required this.child,
    super.key,
    this.desktopPadding,
    this.tabletPadding,
    this.mobilePadding,
  });

  final EdgeInsets? desktopPadding;
  final EdgeInsets? tabletPadding;
  final EdgeInsets? mobilePadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BreakPoints.isDesktop(context)
          ? desktopPadding ?? EdgeInsets.zero
          : BreakPoints.isTablet(context)
              ? tabletPadding ?? EdgeInsets.zero
              : mobilePadding ?? EdgeInsets.zero,
      child: child,
    );
  }
}
