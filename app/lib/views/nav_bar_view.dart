import 'package:cojekjidlu/theme.dart';
import 'package:cojekjidlu/views/add_meal_view.dart';
import 'package:cojekjidlu/views/find_random_meal_view.dart';
import 'package:cojekjidlu/views/meal_list_view.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView();

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      MealListView(),
      AddMealView(),
      FindRandomMealView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Jídla',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Přídat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Najít',
          ),
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: navBarUnselected,
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }
}
