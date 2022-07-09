import 'package:flutter/material.dart';

class NavigatorService {
  // Create a GlobalKey to manage this Navigator widget
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return _navKey.currentState!.pushNamed(routeName);
  }

  void pop() => _navKey.currentState!.pop();
}
