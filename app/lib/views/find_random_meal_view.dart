import 'package:flutter/material.dart';

class FindRandomMealView extends StatefulWidget {
  @override
  State<FindRandomMealView> createState() => _FindRandomMealViewState();
}

class _FindRandomMealViewState extends State<FindRandomMealView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Náhodné jídlo'), centerTitle: true),
      body: SizedBox.shrink(),
    );
  }
}
