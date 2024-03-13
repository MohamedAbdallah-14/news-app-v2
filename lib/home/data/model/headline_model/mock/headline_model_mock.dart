import 'package:news_app/core/helpers/app_faker.dart';
import 'package:news_app/home/data/model/headline_model/headline_model.dart';

class HeadlineModelMock {
//*this return the !same! instance every time it's called
  static final mock = random;

  //*this return the !different! instance every time it's called
  static HeadlineModel get random => HeadlineModel(
        id: AppFaker.randomId,
        title: AppFaker.word,
        description: AppFaker.sentence,
        favorite: AppFaker.randomBool,
      );

  static List<HeadlineModel> get randomList => List.generate(
        AppFaker.randomInt(max: 10),
        (index) => random,
      );
}
