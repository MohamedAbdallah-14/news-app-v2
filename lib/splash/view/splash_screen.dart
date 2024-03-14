import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/helpers/generic_error_handler.dart';
import 'package:news_app/core/view/widgets/app_screen.dart';
import 'package:news_app/core/view/widgets/language_selector.dart';
import 'package:news_app/home/logic/news/news_cubit.dart';
import 'package:news_app/home/view/screen/news_screen.dart';

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
    // wait for 1 seconds just to show the splash screen
    Future<void>.delayed(const Duration(seconds: 1), () {
      context.read<NewsCubit>().getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NewsCubit, NewsState>(
          listenWhen: (previous, current) =>
              previous.response != current.response && current.response != null,
          listener: (context, state) {
            Navigator.pushReplacementNamed(context, NewsScreen.id);
          },
        ),
        BlocListener<NewsCubit, NewsState>(
          listenWhen: (previous, current) =>
              previous.failure != current.failure && current.failure != null,
          listener: (context, state) {
            final failure = state.failure;
            GenericErrorHandler.instance.handle(
              failure: failure!,
              onRetry: () => context.read<NewsCubit>().retry(),
              context: context,
            );
          },
        ),
      ],
      child: AppScreen(
        backgroundColor: AppColors.background,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 32),
              child: const LanguageSelector(),
            ),
            const Spacer(),
            // if we have a logo it would be nice to add it here
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
