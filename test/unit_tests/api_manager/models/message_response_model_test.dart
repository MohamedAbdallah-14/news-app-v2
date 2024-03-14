import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/data/api_manager/api_manager.dart';

void main() {
  group('MessageResponseModel test', () {
    test('should be able to create an instance from map', () {
      final json = MessageResponseModelMock.mock.toMap();

      final categoryModel = MessageResponseModel.fromMap(json);

      expect(categoryModel, MessageResponseModelMock.mock);
    });
  });
}
