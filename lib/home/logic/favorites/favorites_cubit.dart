import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_app/home/data/model/headline_model/headline_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends HydratedCubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState(headlines: []));

  void _addFavorite(HeadlineModel headline) {
    final newHeadlines = List<HeadlineModel>.from(state.headlines)
      ..add(headline);
    emit(state.copyWith(headlines: newHeadlines));
  }

  void _removeFavorite(HeadlineModel headline) {
    final newHeadlines = List<HeadlineModel>.from(state.headlines)
      ..remove(headline);
    emit(state.copyWith(headlines: newHeadlines));
  }

  void toggleFavorite(HeadlineModel headline) {
    if (state.headlines.contains(headline)) {
      _removeFavorite(headline);
    } else {
      _addFavorite(headline);
    }
  }

  void toggleShowFavorites() {
    emit(state.copyWith(showFavorites: !state.showFavorites));
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) =>
      FavoritesState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    return state.toJson();
  }
}
