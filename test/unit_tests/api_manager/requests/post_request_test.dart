import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/data/api_manager/models/request/base_request_defaults.dart';

import '../../../mock/data/post_request_mock.dart';
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

  group('Post Request', () {
    late PostRequestMock postRequest;
    late RequestModelMock requestModel;

    setUp(() {
      requestModel = RequestModelMock(data: 'data_mock');
      postRequest = PostRequestMock(requestModel);
    });

    group('should behave same as base', () {
      test('should generate right url', () async {
        expect(postRequest.baseUrl, baseUrl);
        expect(postRequest.url, '${baseUrl}path');
      });

      test('should referance request model canceltoekn', () async {
        expect(postRequest.cancelToken, requestModel.cancelToken);
      });
    });

    test('method should be POST', () async {
      expect(postRequest.method, 'POST');
    });

    test('data should be equestModel.toMap', () async {
      expect(
        (await postRequest.data as FormData).fields.first.value,
        FormData.fromMap(await requestModel.toMap()).fields.first.value,
      );
    });

    test('queryParameters should be null', () async {
      expect(await postRequest.queryParameters, null);
    });
  });
}
