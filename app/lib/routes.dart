import 'package:cojekjidlu/views/nav_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widgetToReturn = Scaffold(appBar: AppBar(title: const Text('404')));

    switch (settings.name) {
      case 'nav_bar':
        widgetToReturn = NavBarView();
        break;
    }
    return CupertinoPageRoute(builder: (_) => widgetToReturn);
  }
}
