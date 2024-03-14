import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/helpers/breakpoints.dart';

class ScrollButton extends StatelessWidget {
  const ScrollButton({
    required this.controller,
    required this.isLeft,
    super.key,
  });
  final ScrollController controller;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    if (BreakPoints.isDesktop(context) && kIsWeb) {
      return Container(
        width: 34,
        height: 34,
        margin: const EdgeInsets.only(top: 26, right: 8, left: 8),
        decoration: BoxDecoration(
          color: AppColors.darkGray,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.darkGrayIII,
          ),
        ),
        child: InkWell(
          onTap: () {
            controller.animateTo(
              controller.offset + (isLeft ? -800 : 800),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: Icon(
            isLeft ? Icons.arrow_back : Icons.arrow_forward,
            color: AppColors.white,
            size: 22,
          ),
        ),
      );
    }

    return Container();
  }
}
