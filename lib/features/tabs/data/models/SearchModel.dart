import 'package:hive/hive.dart';
part 'SearchModel.g.dart';

class SearchModel {
  SearchModel({
    this.q,
    this.from,
    this.to,
    this.more,
    this.count,
    this.hits,
  });

  SearchModel.fromJson(dynamic json) {
    q = json['q'];
    from = json['from'];
    to = json['to'];
    more = json['more'];
    count = json['count'];
    if (json['hits'] != null) {
      hits = [];
      json['hits'].forEach((v) {
        hits?.add(Hits.fromJson(v));
      });
    }
  }
  String? q;
  num? from;
  num? to;
  bool? more;
  num? count;
  List<Hits>? hits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['q'] = q;
    map['from'] = from;
    map['to'] = to;
    map['more'] = more;
    map['count'] = count;
    if (hits != null) {
      map['hits'] = hits?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Hits {
  Hits({
    this.recipe,
  });

  Hits.fromJson(dynamic json) {
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
  }
  Recipe? recipe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (recipe != null) {
      map['recipe'] = recipe?.toJson();
    }
    return map;
  }
}

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  Recipe({
    this.uri,
    this.label,
    this.image,
    this.source,
    this.url,
    this.shareAs,
    this.yield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.totalNutrients,

  });

  Recipe.fromJson(dynamic json) {
    uri = json['uri'];
    label = json['label'];
    image = json['image'];
    source = json['source'];
    url = json['url'];
    shareAs = json['shareAs'];
    yield = json['yield'];
    dietLabels =
        json['dietLabels'] != null ? json['dietLabels'].cast<String>() : [];
    healthLabels =
        json['healthLabels'] != null ? json['healthLabels'].cast<String>() : [];
    if (json['cautions'] != null) {
      cautions = [];
      json['cautions'].forEach((v) {
        // cautions?.add(Dynamic.fromJson(v));
      });
    }
    ingredientLines = json['ingredientLines'] != null
        ? json['ingredientLines'].cast<String>()
        : [];
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
    calories = json['calories'];
    totalWeight = json['totalWeight'];
    totalTime = json['totalTime'];
    cuisineType =
        json['cuisineType'] != null ? json['cuisineType'].cast<String>() : [];
    mealType = json['mealType'] != null ? json['mealType'].cast<String>() : [];
    dishType = json['dishType'] != null ? json['dishType'].cast<String>() : [];
    totalNutrients = json['totalNutrients'] != null
        ? TotalNutrients.fromJson(json['totalNutrients'])
        : null;

  }

  @HiveField(0)
  String? uri;
  @HiveField(1)
  String? label;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? source;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? shareAs;
  @HiveField(6)
  num? yield;
  @HiveField(7)
  List<String>? dietLabels;
  @HiveField(8)
  List<String>? healthLabels;
  @HiveField(9)
  List<dynamic>? cautions;
  @HiveField(10)
  List<String>? ingredientLines;
  @HiveField(11)
  List<Ingredients>? ingredients;
  @HiveField(12)
  double? calories;
  @HiveField(13)
  num? totalWeight;
  @HiveField(14)
  double? totalTime;
  @HiveField(15)
  List<String>? cuisineType;
  @HiveField(16)
  List<String>? mealType;
  @HiveField(17)
  List<String>? dishType;
  @HiveField(18)
  TotalNutrients? totalNutrients;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uri'] = uri;
    map['label'] = label;
    map['image'] = image;
    map['source'] = source;
    map['url'] = url;
    map['shareAs'] = shareAs;
    map['yield'] = yield;
    map['dietLabels'] = dietLabels;
    map['healthLabels'] = healthLabels;
    if (cautions != null) {
      map['cautions'] = cautions?.map((v) => v.toJson()).toList();
    }
    map['ingredientLines'] = ingredientLines;
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    map['calories'] = calories;
    map['totalWeight'] = totalWeight;
    map['totalTime'] = totalTime;
    map['cuisineType'] = cuisineType;
    map['mealType'] = mealType;
    map['dishType'] = dishType;
    if (totalNutrients != null) {
      map['totalNutrients'] = totalNutrients?.toJson();
    }
    return map;
  }
}

@HiveType(typeId: 1)
class Ingredients extends HiveObject {
  Ingredients({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  Ingredients.fromJson(dynamic json) {
    text = json['text'];
    quantity = json['quantity'];
    measure = json['measure'];
    food = json['food'];
    weight = json['weight'];
    foodCategory = json['foodCategory'];
    foodId = json['foodId'];
    image = json['image'];
  }

  @HiveField(0)
  String? text;
  @HiveField(1)
  num? quantity;
  @HiveField(2)
  String? measure;
  @HiveField(3)
  String? food;
  @HiveField(4)
  num? weight;
  @HiveField(5)
  String? foodCategory;
  @HiveField(6)
  String? foodId;
  @HiveField(7)
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['quantity'] = quantity;
    map['measure'] = measure;
    map['food'] = food;
    map['weight'] = weight;
    map['foodCategory'] = foodCategory;
    map['foodId'] = foodId;
    map['image'] = image;
    return map;
  }
}

@HiveType(typeId: 2)
class TotalNutrients extends HiveObject {
  TotalNutrients({
    this.enerckcal,
    this.fat,
    this.chocdf,
    this.procnt,
  });

  TotalNutrients.fromJson(dynamic json) {
    enerckcal = json['ENERC_KCAL'] != null
        ? EnercKcal.fromJson(json['ENERC_KCAL'])
        : null;
    fat = json['FAT'] != null ? Fat.fromJson(json['FAT']) : null;

    chocdf = json['CHOCDF'] != null ? Chocdf.fromJson(json['CHOCDF']) : null;
    procnt = json['PROCNT'] != null ? Procnt.fromJson(json['PROCNT']) : null;
  }
  @HiveField(0)
  EnercKcal? enerckcal;
  @HiveField(1)
  Fat? fat;
  @HiveField(2)
  Chocdf? chocdf;
  @HiveField(3)
  Procnt? procnt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (enerckcal != null) {
      map['ENERC_KCAL'] = enerckcal?.toJson();
    }
    if (fat != null) {
      map['FAT'] = fat?.toJson();
    }

    if (chocdf != null) {
      map['CHOCDF'] = chocdf?.toJson();
    }

    if (procnt != null) {
      map['PROCNT'] = procnt?.toJson();
    }

    return map;
  }
}

@HiveType(typeId: 3)
class EnercKcal extends HiveObject {
  EnercKcal({
    this.label,
    this.quantity,
    this.unit,
  });

  EnercKcal.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  @HiveField(0)
  String? label;
  @HiveField(1)
  num? quantity;
  @HiveField(2)
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

@HiveType(typeId: 4)
class Procnt {
  Procnt({
    this.label,
    this.quantity,
    this.unit,
  });

  Procnt.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  @HiveField(0)
  String? label;
  @HiveField(1)
  num? quantity;
  @HiveField(2)
  String? unit;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

@HiveType(typeId: 5)
class Fat {
  Fat({
    this.label,
    this.quantity,
    this.unit,
  });

  Fat.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  @HiveField(0)
  String? label;
  @HiveField(1)
  num? quantity;
  @HiveField(2)
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

@HiveType(typeId: 6)
class Chocdf {
  Chocdf({
    this.label,
    this.quantity,
    this.unit,
  });

  Chocdf.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  @HiveField(0)
  String? label;
  @HiveField(1)
  num? quantity;
  @HiveField(2)
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}



