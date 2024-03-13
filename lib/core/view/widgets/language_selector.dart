import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/logic/language_cubit/language_cubit.dart';
import 'package:news_app/generated/assets.gen.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key = const Key('LanguageSelector')});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: const Key('LanguageSelectorSafeArea'),
      bottom: false,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          key: const Key('LanguageSelectorContainer'),
          margin: const EdgeInsets.only(top: 16, right: 16),
          width: 175,
          decoration: BoxDecoration(
            color: AppColors.darkGray,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.brightGray,
            ),
          ),
          child: BlocBuilder<LanguageCubit, LanguageState>(
            key: const Key('LanguageSelectorBlocBuilder'),
            builder: (context, state) {
              return DropdownButton<Locale>(
                key: const Key('LanguageSelectorDropdownButton'),
                value: state.locale,
                dropdownColor: AppColors.darkGray,
                borderRadius: BorderRadius.circular(5),
                icon: const Icon(Icons.keyboard_arrow_down),
                isExpanded: true,
                underline: Container(),
                items: [
                  DropdownMenuItem(
                    key: const Key('LanguageSelectorDropdownMenuItem_DE'),
                    value: const Locale.fromSubtags(languageCode: 'de'),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Assets.imagesFlagsDe.image(),
                        ),
                        const Text('Deutsch'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    key: const Key('LanguageSelectorDropdownMenuItem_EN'),
                    value: const Locale.fromSubtags(languageCode: 'en'),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Assets.imagesFlagsEn.image(),
                        ),
                        const Text('English'),
                      ],
                    ),
                  ),
                ],
                onChanged: (locale) => context
                    .read<LanguageCubit>()
                    .changeLanguage(locale?.languageCode),
              );
            },
          ),
        ),
      ),
    );
  }
}
