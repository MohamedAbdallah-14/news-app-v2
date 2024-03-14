import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/home/data/model/headline_model/headline_model.dart';
import 'package:news_app/home/logic/favorites/favorites_cubit.dart';

class HeadlineCell extends StatelessWidget {
  const HeadlineCell({
    required this.headline,
    super.key = const Key('HeadlineGridCell'),
  });
  final HeadlineModel headline;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 12),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.darkGrayIV,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.darkGrayIII,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              headline.title,
                              style: textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Text(
                                headline.description,
                                style: textTheme.bodyMedium,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Favorite button
                      BlocBuilder<FavoritesCubit, FavoritesState>(
                        buildWhen: (previous, current) =>
                            previous.headlines
                                .where((e) => e.id == headline.id) !=
                            current.headlines.where((e) => e.id == headline.id),
                        builder: (context, state) {
                          return IconButton(
                            key: const Key('FavoriteButton'),
                            icon: Icon(
                              state.headlines.contains(headline)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppColors.deepRed,
                            ),
                            onPressed: () {
                              context
                                  .read<FavoritesCubit>()
                                  .toggleFavorite(headline);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
