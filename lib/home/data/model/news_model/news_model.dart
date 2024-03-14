import 'package:equatable/equatable.dart';
import 'package:news_app/home/data/model/headline_model/headline_model.dart';

class NewsModel extends Equatable {
  const NewsModel({
    required this.headlines,
    required this.category,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      headlines: List<HeadlineModel>.from(
        (map['headlines'] as List<dynamic>).map(
          (e) => HeadlineModel.fromMap(e as Map<String, dynamic>),
        ),
      ),
      category: map['category'] as String,
    );
  }

  final List<HeadlineModel> headlines;
  final String category;

  Map<String, dynamic> toMap() => {
        'headlines': headlines.map((x) => x.toMap()).toList(),
        'category': category,
      };

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        headlines,
        category,
      ];
}
