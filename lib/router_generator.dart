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
        if (arguments is String) {
          return GetPageRoute(
            page: () => HomeScreen(
              nama: arguments,
            ),
          );
        }
        return null;
    }
  }
}
