import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/view/widgets/app_screen.dart';
import 'package:news_app/core/view/widgets/language_selector.dart';
import 'package:news_app/l10n/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 32),
            child: const LanguageSelector(),
          ),
          const Spacer(),
          // current selected language
          Text('${context.l10n.language}: ${context.l10n.localeName}'),
          const Spacer(),
        ],
      ),
    );
  }
}
