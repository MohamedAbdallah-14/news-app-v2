import 'package:news_app/core/data/api_manager/models/response/generic_api_response_model.dart';
import 'package:news_app/core/helpers/app_faker.dart';

class GenericApiResponseModelMock {
  // This return the !same! instance every time it's called.
  static final mock = random;

  // This return the !different! instance every time it's called.
  static GenericApiResponseModel get random {
    return GenericApiResponseModel(
      success: AppFaker.randomBool,
      errorMessage: AppFaker.sentence,
      responseCode: AppFaker.responseStatus,
      responseMessage: AppFaker.sentence,
    );
  }
}
