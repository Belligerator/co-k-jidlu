import 'package:cojekjidlu/services/api_service.dart';
import 'package:cojekjidlu/services/meal_service.dart';
import 'package:cojekjidlu/services/modal_service.dart';
import 'package:cojekjidlu/services/nav_service.dart';
import 'package:cojekjidlu/services/state_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavService());
  locator.registerLazySingleton(() => StateService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => MealService());
  locator.registerLazySingleton(() => ModalService());
}
