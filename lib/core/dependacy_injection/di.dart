import 'package:get_it/get_it.dart';
import 'package:news_app/core/data/api_manager/api_manager.dart';

final di = GetIt.instance;

void initDependencyInjection() {
  di.registerLazySingleton(APIsManager.new);
}
