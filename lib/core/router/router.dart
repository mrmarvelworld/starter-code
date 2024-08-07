import 'package:flutter/material.dart';
import 'package:starter_codes/core/router/routing_constants.dart';

class AppRouter {
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
  }) {
    return MaterialPageRoute(
        builder: (context) => viewToShow, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Map<String, dynamic> routeArgs = settings.arguments != null
    //     ? settings.arguments as Map<String, dynamic>
    //     : {};

    switch (settings.name) {
      default:
        return _getPageRoute(settings: settings, viewToShow: const Scaffold());
    }
  }
}
