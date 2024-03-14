import 'package:news_app/core/data/api_manager/api_manager.dart';
import 'package:news_app/core/data/api_manager/models/request/get_request.dart';

class NewsRequest with Request, GetRequest {
  const NewsRequest();

  @override
  String get path => '1426114b-e64b-44fa-b010-40e864812f04';
}
