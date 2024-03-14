import 'package:news_app/core/helpers/app_faker.dart';
import 'package:news_app/home/data/model/headline_model/mock/headline_model_mock.dart';
import 'package:news_app/home/data/model/news_model/news_model.dart';

class NewsModelMock {
//*this return the !same! instance every time it's called
  static final mock = random;

  //*this return the !different! instance every time it's called
  static NewsModel get random => NewsModel(
        headlines: HeadlineModelMock.randomList,
        category: AppFaker.word,
      );

  static List<NewsModel> get randomList => List.generate(
        AppFaker.randomInt(max: 10),
        (index) => random,
      );
}
