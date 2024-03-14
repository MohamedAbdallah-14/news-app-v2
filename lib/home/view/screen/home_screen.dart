import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/view/widgets/app_screen.dart';
import 'package:news_app/home/logic/news/news_cubit.dart';
import 'package:news_app/home/view/widgets/categories/categories_list.dart';
import 'package:news_app/home/view/widgets/news/news_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const id = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return AppScreen(
          child: RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () async {
              await context.read<NewsCubit>().reload();
            },
            child: const SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    CategoriesList(),
                    NewsList(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
