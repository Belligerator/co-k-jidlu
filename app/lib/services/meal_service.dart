import 'dart:async';

import 'package:cojekjidlu/locator.dart';
import 'package:cojekjidlu/models/loadable_content.dart';
import 'package:cojekjidlu/models/meal.dart';
import 'package:cojekjidlu/models/responses/api_response.dart';
import 'package:cojekjidlu/services/api_service.dart';
import 'package:cojekjidlu/services/state_service.dart';

class MealService {
  final _apiService = locator.get<ApiService>();
  final _stateService = locator.get<StateService>();

  Future<void> loadMeals() async {
    APIResponse apiResponse = await _apiService.getMeals();
    if (apiResponse.runtimeType == ErrorState) {
      _stateService.setMeals(LoadableContent.error((apiResponse as ErrorState).msg));
    } else {
      _stateService.setMeals(LoadableContent.data((apiResponse as SuccessState).value));
    }
  }

  Future<APIResponse> saveNote(Meal meal) async {
    APIResponse response = await _apiService.addMeal(meal);
    if (response.runtimeType == ErrorState) {
      return response;
    } else {
      return APIResponse.success((response as SuccessState).value);
    }
  }
}
