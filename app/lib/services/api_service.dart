import 'dart:convert';

import 'package:cojekjidlu/config.dart';
import 'package:cojekjidlu/locator.dart';
import 'package:cojekjidlu/models/meal.dart';
import 'package:cojekjidlu/models/responses/api_response.dart';
import 'package:cojekjidlu/services/nav_service.dart';
import 'package:cojekjidlu/services/state_service.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  final _stateService = locator.get<StateService>();
  final _navService = locator.get<NavService>();
  final String defaultServerError = 'Na serveru nastala chyba.';
  final String defaultCannotGetDataMessage = 'Data se nepodařilo načíst.';
  final String defaultCannotPostDataMessage = 'Data se nepodařilo uložit.';
  final String defaultUserSignedOutMessage = 'Uživatel není přihlášený.';

  Map<String, String> defaultHeaders() {
    return {"Content-Type": "application/json"};
  }

  Future<APIResponse> getMeals() async {
    try {
      Response response = await http.get(Uri.parse('$kApiEndpoint/all'), headers: defaultHeaders());

      if (response.statusCode == 200) {
        List<Meal> meals = List<dynamic>.from(jsonDecode(response.body)).map((item) => Meal.fromJSON(item)).toList();
        return APIResponse.success(meals);
      } else if (response.statusCode == 500) {
        return APIResponse.error(defaultServerError);
      } else {
        print('Get meals status ERROR: ${response.statusCode}');
      }
    } catch (error, stacktrace) {
      print('Get meals ERROR: $error');
    }
    return APIResponse.error(defaultCannotGetDataMessage);
  }

  Future<APIResponse> addMeal(Meal meal) async {
    try {
      Map<String, dynamic> body = meal.toJSON();
      Response response = await http.post(Uri.parse('$kApiEndpoint/add'), headers: defaultHeaders(), body: json.encode(body));
      if (response.statusCode == 200) {
        return APIResponse.success(Meal.fromJSON(jsonDecode(response.body)));
      } else if (response.statusCode == 500) {
        return APIResponse.error(defaultServerError);
      } else {
        print('Add meal status ERROR: ${response.statusCode}');
      }
    } catch (error, stacktrace) {
      print('POST Add meal ERROR: $error');
    }
    return APIResponse.error(defaultCannotPostDataMessage);
  }
}
