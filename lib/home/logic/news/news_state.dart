part of 'news_cubit.dart';

@immutable
class NewsState extends Equatable {
  const NewsState({
    this.loading = false,
    this.failure,
    this.response,
    this.selectedCategory,
  });

  final bool loading;
  final Failure? failure;
  final NewsResponseModel? response;
  final String? selectedCategory;

  NewsModel? get selectedNewsModel => response?.news.firstWhere(
        (element) => element.category == selectedCategory,
        orElse: () => const NewsModel(
          category: '',
          headlines: [],
        ),
      );

  List<String>? get categories => response?.categories;

  NewsState requestSuccess(NewsResponseModel response) => copyWith(
        loading: false,
        response: Nullable(response),
        selectedCategory: response.categories.first,
      );

  NewsState requestFailed(Failure failure) =>
      copyWith(loading: false, failure: Nullable(failure));

  NewsState requestLoading() => copyWith(
        loading: true,
        failure: Nullable(null),
        response: Nullable(null),
      );

  NewsState copyWith({
    bool? loading,
    Nullable<Failure?>? failure,
    Nullable<NewsResponseModel?>? response,
    String? selectedCategory,
  }) {
    return NewsState(
      loading: loading ?? this.loading,
      failure: failure == null ? this.failure : failure.value,
      response: response == null ? this.response : response.value,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        failure,
        response,
        selectedCategory,
      ];

  @override
  bool get stringify => true;
}
