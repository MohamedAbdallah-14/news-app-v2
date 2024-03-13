import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/data/api_manager/models/request/base_request_defaults.dart';

import '../../../mock/data/get_request_mock.dart';
import '../../../mock/data/request_model_mock.dart';

void main() {
  const baseUrl = 'http://localhost/';
  final headers = {'lang': 'en'};
  const token = {'Authorization': 'Bearer token'};

  setUpAll(() {
    BaseRequestDefaults.instance.baseUrl = baseUrl;
    BaseRequestDefaults.instance.addHeaders(headers);
    BaseRequestDefaults.instance.token = token;
  });

  group('Get Request', () {
    late GetRequestMock getRequest;
    late RequestModelMock requestModel;

    setUp(() {
      requestModel = RequestModelMock(data: 'data_mock');
      getRequest = GetRequestMock(requestModel);
    });

    group('should behave same as base', () {
      test('should generate right url', () async {
        expect(getRequest.baseUrl, baseUrl);
        expect(getRequest.url, '${baseUrl}path');
      });

      test('should referance request model canceltoekn', () async {
        expect(getRequest.cancelToken, requestModel.cancelToken);
      });
    });

    test('method should be GET', () async {
      expect(getRequest.method, 'GET');
    });

    test('data should be {}', () async {
      expect(await getRequest.data, null);
    });

    test('queryParameters should be requestModel.toMap', () async {
      expect(await getRequest.queryParameters, await requestModel.toMap());
    });
  });
}
