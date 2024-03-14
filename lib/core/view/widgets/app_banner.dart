import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';

const double _kOffset = 35;
const double _kHeight = 23;
const Rect _kRect =
    Rect.fromLTWH(-_kOffset, _kOffset - _kHeight, _kOffset * 2.0, _kHeight);

class AppBanner extends StatelessWidget {
  const AppBanner({
    required this.message,
    required this.location,
    super.key,
    this.child,
    this.color = AppColors.deepRed,
  });

  final Widget? child;
  final String message;
  final BannerLocation location;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: BannerPainter(
        message: message,
        textDirection: Directionality.of(context),
        layoutDirection: Directionality.of(context),
        color: color,
        textStyle: Theme.of(context).textTheme.titleSmall,
      ),
      child: child,
    );
  }
}

class BannerPainter extends CustomPainter {
  BannerPainter({
    required this.message,
    required this.textDirection,
    required this.layoutDirection,
    this.color = AppColors.deepRed,
    this.textStyle,
  }) : super(repaint: PaintingBinding.instance.systemFonts);

  final String message;
  final TextDirection textDirection;
  final TextDirection layoutDirection;
  final Color color;
  final TextStyle? textStyle;

  static const BoxShadow _shadow = BoxShadow(
    color: Color(0x7F000000),
    blurRadius: 6,
  );

  bool _prepared = false;
  late TextPainter _textPainter;
  late Paint _paintShadow;
  late Paint _paintBanner;

  void _prepare() {
    _paintShadow = _shadow.toPaint();
    _paintBanner = Paint()..color = color;
    _textPainter = TextPainter(
      text: TextSpan(style: textStyle, text: message),
      textAlign: TextAlign.center,
      textDirection: textDirection,
    );
    _prepared = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (!_prepared) {
      _prepare();
    }
    canvas
      ..translate(size.width, 0)
      ..rotate(math.pi / 4.0)
      ..drawRect(_kRect, _paintShadow)
      ..drawRect(_kRect, _paintBanner);
    const width = _kOffset * 2.0;
    _textPainter
      ..layout(minWidth: width, maxWidth: width)
      ..paint(
        canvas,
        _kRect.topLeft + Offset(0, (_kRect.height - _textPainter.height) / 2.0),
      );
  }

  @override
  bool shouldRepaint(BannerPainter oldDelegate) {
    return message != oldDelegate.message ||
        color != oldDelegate.color ||
        textStyle != oldDelegate.textStyle;
  }

  @override
  bool hitTest(Offset position) => false;
}
