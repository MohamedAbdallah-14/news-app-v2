import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/home/data/model/headline_model/headline_model.dart';
import 'package:news_app/home/data/model/headline_model/mock/headline_model_mock.dart';

void main() {
  test('HeadlineModel should be able to convert from and to json', () async {
    // arrange
    final json = HeadlineModelMock.mock.toMap();
    // act
    final headlineModel = HeadlineModel.fromMap(json);
    // assert
    expect(headlineModel, HeadlineModelMock.mock);
  });
}
