import 'package:flutter/material.dart';
import 'package:starter_codes/core/router/routing_constants.dart';

enum TransitionType { SlideUp, Side, Breeze }

class AppRouter {
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
    TransitionType transition = TransitionType.Side, // default to Side
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => viewToShow,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transition) {
          case TransitionType.SlideUp:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Start from the bottom
                end: Offset.zero, // Slide to the center
              ).animate(animation),
              child: child,
            );

          case TransitionType.Side:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Start from the right
                end: Offset.zero, // Slide to the center
              ).animate(animation),
              child: child,
            );

          case TransitionType.Breeze:
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(
                  begin: 0.9, // Slight zoom-in effect
                  end: 1.0,
                ).animate(animation),
                child: child,
              ),
            );

          default:
            return child;
        }
      },
    );
  }

  static Route<dynamic> generateRoute(
    RouteSettings settings, {
    TransitionType transition = TransitionType.Side,
  }) {
    // Map<String, dynamic> routeArgs = settings.arguments != null
    //     ? settings.arguments as Map<String, dynamic>
    //     : {};

    switch (settings.name) {
      default:
        return _getPageRoute(settings: settings, viewToShow: const Scaffold());
    }
  }
}
