import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';

class BackButtonWithName extends StatelessWidget {
  const BackButtonWithName({
    required this.name,
    super.key = const Key('BackButtonWithName'),
    this.icon,
    this.closeIcon = false,
    this.onTap,
    this.width,
  });
  final IconData? icon;
  final String name;
  final bool closeIcon;
  final VoidCallback? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      key: const Key('BackButtonWithNameInkWell'),
      onTap: () {
        if (onTap != null) {
          onTap?.call();
          return;
        }
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
      child: Container(
        width: width ?? double.infinity,
        key: const Key('BackButtonWithNameContainer'),
        padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
        child: Row(
          key: const Key('BackButtonWithNameRow'),
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? (closeIcon ? Icons.close : Icons.arrow_back),
              key: const Key('BackButtonWithNameIcon'),
              color: AppColors.white,
            ),
            const SizedBox(
              key: Key('BackButtonWithNameSize'),
              width: 8,
            ),
            if (name.isNotEmpty)
              Expanded(
                child: Text(
                  name.toUpperCase(),
                  style: textTheme.labelLarge,
                  key: const Key(
                    'BackButtonWithNameText',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
