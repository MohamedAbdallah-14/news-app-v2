import 'package:equatable/equatable.dart';

class HeadlineModel extends Equatable {
  const HeadlineModel({
    required this.id,
    required this.title,
    required this.description,
    required this.favorite,
  });

  factory HeadlineModel.fromMap(Map<String, dynamic> map) {
    return HeadlineModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      favorite: map['favorite'] as bool,
    );
  }

  final int id;
  final String title;
  final String description;
  final bool favorite;

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'favorite': favorite,
      };

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        title,
        description,
        favorite,
      ];
}
