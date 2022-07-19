import 'package:flutter/material.dart';

class NavigationService {
  navigateTo(context, {required String routeName}) {
    Navigator.of(context).pushNamed(routeName);
  }

  void pop(context) => Navigator.of(context).pop();
}
