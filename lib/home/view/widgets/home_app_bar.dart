import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/breakpoints.dart';
import 'package:news_app/core/view/widgets/back_button_with_name.dart';
import 'package:news_app/home/logic/favorites/favorites_cubit.dart';
import 'package:news_app/l10n/l10n.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key = const Key('MenuAppBar'),
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: BreakPoints.maxWidth + 100,
        maxHeight: BreakPoints.isMobile(context) ? 138 : 122,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: BreakPoints.isMobile(context) ? 24 : 54,
          top: 16,
          bottom: 16,
          right: BreakPoints.isMobile(context) ? 0 : 24,
        ),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return Row(
              children: [
                if (state.showFavorites)
                  BackButtonWithName(
                    name: context.l10n.back,
                    width: 120,
                    onTap: () => BlocProvider.of<FavoritesCubit>(context)
                        .toggleShowFavorites(),
                  )
                else
                  BackButtonWithName(
                    icon: Icons.home,
                    name: context.l10n.home,
                    width: 160,
                  ),
                const Spacer(),
                BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    return IconButton(
                      key: const Key('HomeAppBarIconButton'),
                      icon: Icon(
                        state.showFavorites
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        BlocProvider.of<FavoritesCubit>(context)
                            .toggleShowFavorites();
                      },
                    );
                  },
                ),
                const SizedBox(width: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
