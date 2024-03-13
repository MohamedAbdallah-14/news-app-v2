import 'package:news_app/core/data/api_manager/models/request/get_request.dart';
import 'package:news_app/core/data/api_manager/models/request/request.dart';
import 'package:news_app/core/data/api_manager/models/request_model.dart';

class GetRequestMock with Request, GetRequest {
  GetRequestMock(this.requestModel);

  @override
  final RequestModel requestModel;

  @override
  String get path => 'path';
}
