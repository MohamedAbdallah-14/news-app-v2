import 'package:news_app/core/data/api_manager/models/request/request.dart';
import 'package:news_app/core/data/api_manager/models/request_model.dart';

class RequestMock with Request {
  RequestMock(this.requestModel);

  @override
  final RequestModel requestModel;

  @override
  Future<dynamic> get data async => {'data': 'data_mock'};

  @override
  String get method => 'GET';

  @override
  String get path => 'path';

  @override
  Future<Map<String, dynamic>> get queryParameters async => {
        'parameter': 'mock',
      };
}
