import 'package:flutter/material.dart';

class NavService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator {
    return navigatorKey.currentState!;
  }
}
