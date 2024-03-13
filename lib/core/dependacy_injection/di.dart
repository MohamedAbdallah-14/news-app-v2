import 'package:get_it/get_it.dart';
import 'package:news_app/core/data/api_manager/api_manager.dart';
import 'package:news_app/home/data/home_repository.dart';
import 'package:news_app/home/di/home_di.dart';

final di = GetIt.instance;

void initDependencyInjection({
  HomeRepository? homeRepository,
}) {
  di.registerLazySingleton(APIsManager.new);

  HomeDI(di, repository: homeRepository);
}
