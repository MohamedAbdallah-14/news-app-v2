import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/data/api_manager/models/request/base_request_defaults.dart';

import '../../../mock/data/request_mock.dart';
import '../../../mock/data/request_mock_with_no_auth.dart';
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

  group('Base Request', () {
    late RequestMock request;
    late RequestMockWihoutAuthorization requestWihoutAuthorization;
    late RequestModelMock requestModel;

    setUp(() {
      requestModel = RequestModelMock(data: 'data_mock');
      request = RequestMock(requestModel);
      requestWihoutAuthorization = RequestMockWihoutAuthorization(requestModel);
    });

    test('should generate right url', () async {
      expect(request.baseUrl, baseUrl);
      expect(request.url, '${baseUrl}path');
    });

    test('should referance request model canceltoekn', () async {
      expect(request.cancelToken, requestModel.cancelToken);
    });

    test('should contain the header', () async {
      expect(request.headers, headers..addAll(token));
    });

    test('should not contain token if includeAuthorization is false', () async {
      expect(requestWihoutAuthorization.headers, headers);
    });
  });
}
