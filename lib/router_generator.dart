import 'package:flutter/material.dart';
import 'package:get/get.dart';

//property
import 'screen/screen.dart';

class RouteGenerator {
  static const routeHome = '/home';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case routeHome:
        return GetPageRoute(
          transition: Transition.downToUp,
          page: () => const HomeScreen(),
        );
    }
  }
}
