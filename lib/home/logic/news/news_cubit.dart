import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/core/data/api_manager/api_manager.dart';
import 'package:news_app/core/helpers/nullable.dart';
import 'package:news_app/home/data/home_repository.dart';
import 'package:news_app/home/data/model/news/news_response_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._repository) : super(const NewsState());

  final HomeRepository _repository;

  Future<void> news() async {
    emit(state.requestLoading());
    final result = await _repository.news();
    emit(
      result.fold(
        (l) => state.requestFailed(l),
        (r) => state.requestSuccess(r),
      ),
    );
  }

  void retry() {
    news();
  }

  Future<void> reload() async {
    emit(state.copyWith(response: Nullable(null)));
    await news();
  }
}
