import 'package:cojekjidlu/models/loadable_content.dart';
import 'package:cojekjidlu/types.dart';
import 'package:flutter/material.dart';

class StateService extends ChangeNotifier {

  ContentMeals _meals = LoadableContent.empty();

  ContentMeals get meals {
    return _meals;
  }

  void setMeals(ContentMeals items) {
    _meals = items;
    notifyListeners();
  }
}
