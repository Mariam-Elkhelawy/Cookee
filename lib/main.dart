import 'package:CookEE/cookEe.dart';
import 'package:CookEE/core/utils/app_strings.dart';
import 'package:CookEE/features/tabs/data/models/SearchModel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(IngredientsAdapter());
  Hive.registerAdapter(TotalNutrientsAdapter());
  Hive.registerAdapter(EnercKcalAdapter());
  Hive.registerAdapter(ProcntAdapter());
  Hive.registerAdapter(FatAdapter());
  Hive.registerAdapter(ChocdfAdapter());
  await Hive.openBox<Recipe>(AppStrings.favBox);
  await Hive.openBox<Recipe>(AppStrings.shoppingBox);

  setupServiceLocator();
  runApp(const CookEE());
}
