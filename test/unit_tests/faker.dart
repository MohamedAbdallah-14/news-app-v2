import 'package:mocktail/mocktail.dart';
import 'package:news_app/core/data/api_manager/models/request/request.dart';

class RequestFake extends Fake implements Request {}

void setupFaker() {
  registerFallbackValue(RequestFake());
}
