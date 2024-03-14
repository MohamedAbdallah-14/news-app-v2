import 'package:mocktail/mocktail.dart';
import 'package:news_app/core/data/api_manager/api_manager.dart';
import 'package:news_app/home/data/home_repository.dart';
import 'package:news_app/home/data/request/news_request.dart';

class MockAPIsManager extends Mock implements APIsManager {}

class MockHomeRepository extends Mock implements HomeRepository {}

class RequestFake extends Fake implements Request {}

class NewsRequestFake extends Fake implements NewsRequest {}

void setupFaker() {
  registerFallbackValue(RequestFake());
}
