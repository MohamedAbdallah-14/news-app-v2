import 'package:news_app/core/data/api_manager/models/request/post_request.dart';
import 'package:news_app/core/data/api_manager/models/request/request.dart';
import 'package:news_app/core/data/api_manager/models/request_model.dart';

class PostRequestMock with Request, PostRequest {
  PostRequestMock(this.requestModel);

  @override
  final RequestModel requestModel;

  @override
  bool get multiPart => true;

  @override
  String get path => 'path';
}
