import 'package:CookEE/cookEe.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/features/tabs/data/models/recipe_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/locator/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(TotalNutrientsAdapter());
  Hive.registerAdapter(NutrientAdapter());
  Hive.registerAdapter(IngredientAdapter());

   await Hive.openBox<Recipe>(AppStrings.favBox);

  setupServiceLocator();
  runApp(const CookEE());
}
