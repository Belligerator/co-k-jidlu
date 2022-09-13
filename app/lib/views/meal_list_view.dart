import 'package:cojekjidlu/locator.dart';
import 'package:cojekjidlu/models/meal.dart';
import 'package:cojekjidlu/services/meal_service.dart';
import 'package:cojekjidlu/services/state_service.dart';
import 'package:cojekjidlu/types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealListView extends StatefulWidget {
  @override
  State<MealListView> createState() => _MealListViewState();
}

class _MealListViewState extends State<MealListView> {
  final _mealService = locator.get<MealService>();

  @override
  void initState() {
    super.initState();
    _mealService.loadMeals();
  }

  @override
  Widget build(BuildContext context) {
    final items = context.select<StateService, ContentMeals>((state) => state.meals);

    List<Meal> meals = [];
    if (!items.hasError && items.hasData && items.data!.isNotEmpty) {
      meals = items.data!;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Seznam jídel'), centerTitle: true),
      body: meals.isEmpty
          ? const Center(child: Text('Nebylo nalezeno žádné jídlo.'))
          : ListView(
              children: [
                for (var meal in meals)
                  ListTile(
                    leading: Text('${meal.id}'),
                    title: Text(meal.name),
                  )
              ],
            ),
    );
  }
}
