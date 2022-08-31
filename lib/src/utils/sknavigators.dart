import 'package:flutter/material.dart';

/// Navigator services
///
/// PushName
/// PushNamedAndRemoveUntil
/// Pop
/// PushReplacementNamed
class NavigatorService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  /// Singleton of navigator key
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> navigateTo(String routeName, {arg}) {
    return _navigatorKey.currentState!
        .pushNamed(routeName, arguments: routeName);
  }

  Future<dynamic> navigateReplaceTo(String routeName, {arg}) {
    return _navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arg);
  }

  void pop() {
    _navigatorKey.currentState!.pop();
  }

  void pushNamedAndRemoveUntil(String routeName, {arg}) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
