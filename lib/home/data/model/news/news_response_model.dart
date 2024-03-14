import 'package:equatable/equatable.dart';
import 'package:news_app/core/data/api_manager/api_manager.dart';
import 'package:news_app/home/data/model/news_model/news_model.dart';

class NewsResponseModel extends Equatable implements ResponseModel {
  const NewsResponseModel({
    required this.news,
    required this.categories,
  });

  factory NewsResponseModel.fromMap(Map<String, dynamic> map) {
    return NewsResponseModel(
      news: List<NewsModel>.from(
        (map['news'] as List<dynamic>)
            .map((e) => NewsModel.fromMap(e as Map<String, dynamic>)),
      ),
      categories: List<String>.from(map['categories'] as List<dynamic>),
    );
  }

  final List<NewsModel> news;
  final List<String> categories;

  Map<String, dynamic> toMap() => {
        'news': news.map((x) => x.toMap()).toList(),
        'categories': categories,
      };

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        news,
        categories,
      ];
}
