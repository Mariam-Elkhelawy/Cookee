import 'package:hive/hive.dart';

part 'recipe_adapter.g.dart';

@HiveType(typeId: 0)
class RecipeA extends HiveObject {
  @HiveField(0)
  String? label;

  @HiveField(1)
  String? image;

  @HiveField(2)
  String? url;

  @HiveField(3)
  double? calories;

  @HiveField(4)
  TotalNutrients? totalNutrients;

  @HiveField(5)
  List<Ingredient>? ingredients;

  RecipeA({
    this.label,
    this.image,
    this.url,
    this.calories,
    this.totalNutrients,
    this.ingredients,
  });
}

@HiveType(typeId: 1)
class TotalNutrients extends HiveObject {
  @HiveField(0)
  Nutrient? procnt;

  @HiveField(1)
  Nutrient? fat;

  @HiveField(2)
  Nutrient? chocdf;

  TotalNutrients({
    this.procnt,
    this.fat,
    this.chocdf,
  });
}

@HiveType(typeId: 2)
class Nutrient extends HiveObject {
  @HiveField(0)
  double? quantity;

  @HiveField(1)
  String? unit;

  Nutrient({
    this.quantity,
    this.unit,
  });
}

@HiveType(typeId: 3)
class Ingredient extends HiveObject {
  @HiveField(0)
  String? text;

  @HiveField(1)
  String? image;

  Ingredient({
    this.text,
    this.image,
  });
}
