import 'package:dio/dio.dart';
import 'package:news_app/core/data/api_manager/models/request/request.dart';

mixin PostRequest on Request {
  @override
  Future<Map<String, dynamic>?> get queryParameters async => null;
  @override
  Future<dynamic> get data async {
    final map = await requestModel.toMap();
    if (map.isEmpty) return null;

    return multiPart ? FormData.fromMap(map) : map;
  }

  @override
  String get method => 'POST';
}
