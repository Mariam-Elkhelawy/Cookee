import 'package:YumFind/config/routes/app_routes_names.dart';
import 'package:YumFind/core/components/reusable_components.dart';
import 'package:YumFind/features/layout/home_screen.dart';
import 'package:YumFind/features/splash_screen.dart';
import 'package:YumFind/features/tabs/presentation/pages/recipe_details_screen.dart';
import 'package:YumFind/features/tabs/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case AppRoutesName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(), settings: settings);
      case AppRoutesName.details:
        return MaterialPageRoute(
            builder: (context) => const RecipeDetailsScreen(),
            settings: settings);
      case AppRoutesName.search:
        return MaterialPageRoute(
            builder: (context) => const SearchScreen(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => unDefinedRoute(), settings: settings);
    }
  }
}
