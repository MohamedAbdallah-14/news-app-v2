part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  const FavoritesState({
    required this.headlines,
    this.showFavorites = false,
  });

  factory FavoritesState.fromMap(Map<String, dynamic> map) {
    return FavoritesState(
      headlines: List<HeadlineModel>.from(
        (map['headlines'] as List<dynamic>).map<HeadlineModel>(
          (x) => HeadlineModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  final List<HeadlineModel> headlines;
  final bool showFavorites;

  FavoritesState copyWith({
    List<HeadlineModel>? headlines,
    bool? showFavorites,
  }) {
    return FavoritesState(
      headlines: headlines ?? this.headlines,
      showFavorites: showFavorites ?? this.showFavorites,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'headlines': headlines.map((x) => x.toMap()).toList(),
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [headlines, showFavorites];
}
