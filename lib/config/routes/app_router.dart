import 'package:CookEE/config/routes/app_routes_names.dart';
import 'package:CookEE/core/components/reusable_components.dart';
import 'package:CookEE/features/layout/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.home:
        return MaterialPageRoute(
            builder: (context) => HomeScreen(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => unDefinedRoute(), settings: settings);
    }
  }
}
