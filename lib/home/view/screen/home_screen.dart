import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/view/widgets/app_screen.dart';
import 'package:news_app/home/logic/favorites/favorites_cubit.dart';
import 'package:news_app/home/logic/news/news_cubit.dart';
import 'package:news_app/home/view/widgets/categories/categories_list.dart';
import 'package:news_app/home/view/widgets/home_app_bar.dart';
import 'package:news_app/home/view/widgets/news/favorites_list.dart';
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
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        const HomeAppBar(),
                        CategoriesList(
                          isHidden: state.showFavorites,
                        ),
                        Visibility(
                          visible: !state.showFavorites,
                          child: const Expanded(child: NewsList()),
                        ),
                        Visibility(
                          visible: state.showFavorites,
                          child: const Expanded(child: FavoritesList()),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
