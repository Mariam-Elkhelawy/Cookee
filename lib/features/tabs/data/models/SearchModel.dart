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
    this.totalDaily,
    this.digest,
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
    totalDaily = json['totalDaily'] != null
        ? TotalDaily.fromJson(json['totalDaily'])
        : null;
    if (json['digest'] != null) {
      digest = [];
      json['digest'].forEach((v) {
        digest?.add(Digest.fromJson(v));
      });
    }
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
  @HiveField(19)
  TotalDaily? totalDaily;
  @HiveField(20)
  List<Digest>? digest;

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
    if (totalDaily != null) {
      map['totalDaily'] = totalDaily?.toJson();
    }
    if (digest != null) {
      map['digest'] = digest?.map((v) => v.toJson()).toList();
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

    // this.fasat,
    // this.fatrn,
    // this.fams,
    // this.fapu,
    // this.cHOCDFnet,
    // this.fibtg,
    // this.sugar,
    // this.chole,
    // this.na,
    // this.ca,
    // this.mg,
    // this.k,
    // this.fe,
    // this.zn,
    // this.p,
    // this.vitarae,
    // this.vitc,
    // this.thia,
    // this.ribf,
    // this.nia,
    // this.vitb6a,
    // this.foldfe,
    // this.folfd,
    // this.folac,
    // this.vitb12,
    // this.vitd,
    // this.tocpha,
    // this.vitk1,
    // this.water,
  });

  TotalNutrients.fromJson(dynamic json) {
    enerckcal = json['ENERC_KCAL'] != null
        ? EnercKcal.fromJson(json['ENERC_KCAL'])
        : null;
    fat = json['FAT'] != null ? Fat.fromJson(json['FAT']) : null;
    // fasat = json['FASAT'] != null ? Fasat.fromJson(json['FASAT']) : null;
    // fatrn = json['FATRN'] != null ? Fatrn.fromJson(json['FATRN']) : null;
    // fams = json['FAMS'] != null ? Fams.fromJson(json['FAMS']) : null;
    // fapu = json['FAPU'] != null ? Fapu.fromJson(json['FAPU']) : null;
     chocdf = json['CHOCDF'] != null ? Chocdf.fromJson(json['CHOCDF']) : null;
    // cHOCDFnet = json['CHOCDF.net'] != null
    //     ? ChocdfNet.fromJson(json['CHOCDF.net'])
    //     : null;
    // fibtg = json['FIBTG'] != null ? Fibtg.fromJson(json['FIBTG']) : null;
    // sugar = json['SUGAR'] != null ? Sugar.fromJson(json['SUGAR']) : null;
     procnt = json['PROCNT'] != null ? Procnt.fromJson(json['PROCNT']) : null;
    // chole = json['CHOLE'] != null ? Chole.fromJson(json['CHOLE']) : null;
    // na = json['NA'] != null ? Na.fromJson(json['NA']) : null;
    // ca = json['CA'] != null ? Ca.fromJson(json['CA']) : null;
    // mg = json['MG'] != null ? Mg.fromJson(json['MG']) : null;
    // k = json['K'] != null ? K.fromJson(json['K']) : null;
    // fe = json['FE'] != null ? Fe.fromJson(json['FE']) : null;
    // zn = json['ZN'] != null ? Zn.fromJson(json['ZN']) : null;
    // p = json['P'] != null ? P.fromJson(json['P']) : null;
    // vitarae =
    //     json['VITA_RAE'] != null ? VitaRae.fromJson(json['VITA_RAE']) : null;
    // vitc = json['VITC'] != null ? Vitc.fromJson(json['VITC']) : null;
    // thia = json['THIA'] != null ? Thia.fromJson(json['THIA']) : null;
    // ribf = json['RIBF'] != null ? Ribf.fromJson(json['RIBF']) : null;
    // nia = json['NIA'] != null ? Nia.fromJson(json['NIA']) : null;
    // vitb6a = json['VITB6A'] != null ? Vitb6a.fromJson(json['VITB6A']) : null;
    // foldfe = json['FOLDFE'] != null ? Foldfe.fromJson(json['FOLDFE']) : null;
    // folfd = json['FOLFD'] != null ? Folfd.fromJson(json['FOLFD']) : null;
    // folac = json['FOLAC'] != null ? Folac.fromJson(json['FOLAC']) : null;
    // vitb12 = json['VITB12'] != null ? Vitb12.fromJson(json['VITB12']) : null;
    // vitd = json['VITD'] != null ? Vitd.fromJson(json['VITD']) : null;
    // tocpha = json['TOCPHA'] != null ? Tocpha.fromJson(json['TOCPHA']) : null;
    // vitk1 = json['VITK1'] != null ? Vitk1.fromJson(json['VITK1']) : null;
    // water = json['WATER'] != null ? Water.fromJson(json['WATER']) : null;
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
    // if (fasat != null) {
    //   map['FASAT'] = fasat?.toJson();
    // }
    // if (fatrn != null) {
    //   map['FATRN'] = fatrn?.toJson();
    // }
    // if (fams != null) {
    //   map['FAMS'] = fams?.toJson();
    // }
    // if (fapu != null) {
    //   map['FAPU'] = fapu?.toJson();
    // }
    if (chocdf != null) {
      map['CHOCDF'] = chocdf?.toJson();
    }
    // if (cHOCDFnet != null) {
    //   map['CHOCDF.net'] = cHOCDFnet?.toJson();
    // }
    // if (fibtg != null) {
    //   map['FIBTG'] = fibtg?.toJson();
    // }
    // if (sugar != null) {
    //   map['SUGAR'] = sugar?.toJson();
    // }
    if (procnt != null) {
      map['PROCNT'] = procnt?.toJson();
    }
    // if (chole != null) {
    //   map['CHOLE'] = chole?.toJson();
    // }
    // if (na != null) {
    //   map['NA'] = na?.toJson();
    // }
    // if (ca != null) {
    //   map['CA'] = ca?.toJson();
    // }
    // if (mg != null) {
    //   map['MG'] = mg?.toJson();
    // }
    // if (k != null) {
    //   map['K'] = k?.toJson();
    // }
    // if (fe != null) {
    //   map['FE'] = fe?.toJson();
    // }
    // if (zn != null) {
    //   map['ZN'] = zn?.toJson();
    // }
    // if (p != null) {
    //   map['P'] = p?.toJson();
    // }
    // if (vitarae != null) {
    //   map['VITA_RAE'] = vitarae?.toJson();
    // }
    // if (vitc != null) {
    //   map['VITC'] = vitc?.toJson();
    // }
    // if (thia != null) {
    //   map['THIA'] = thia?.toJson();
    // }
    // if (ribf != null) {
    //   map['RIBF'] = ribf?.toJson();
    // }
    // if (nia != null) {
    //   map['NIA'] = nia?.toJson();
    // }
    // if (vitb6a != null) {
    //   map['VITB6A'] = vitb6a?.toJson();
    // }
    // if (foldfe != null) {
    //   map['FOLDFE'] = foldfe?.toJson();
    // }
    // if (folfd != null) {
    //   map['FOLFD'] = folfd?.toJson();
    // }
    // if (folac != null) {
    //   map['FOLAC'] = folac?.toJson();
    // }
    // if (vitb12 != null) {
    //   map['VITB12'] = vitb12?.toJson();
    // }
    // if (vitd != null) {
    //   map['VITD'] = vitd?.toJson();
    // }
    // if (tocpha != null) {
    //   map['TOCPHA'] = tocpha?.toJson();
    // }
    // if (vitk1 != null) {
    //   map['VITK1'] = vitk1?.toJson();
    // }
    // if (water != null) {
    //   map['WATER'] = water?.toJson();
    // }
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


class Digest {
  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRDI,
    this.daily,
    this.unit,
    this.sub,
  });

  Digest.fromJson(dynamic json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
    if (json['sub'] != null) {
      sub = [];
      json['sub'].forEach((v) {
        sub?.add(Sub.fromJson(v));
      });
    }
  }
  String? label;
  String? tag;
  String? schemaOrgTag;
  num? total;
  bool? hasRDI;
  num? daily;
  String? unit;
  List<Sub>? sub;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['tag'] = tag;
    map['schemaOrgTag'] = schemaOrgTag;
    map['total'] = total;
    map['hasRDI'] = hasRDI;
    map['daily'] = daily;
    map['unit'] = unit;
    if (sub != null) {
      map['sub'] = sub?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Sub {
  Sub({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRDI,
    this.daily,
    this.unit,
  });

  Sub.fromJson(dynamic json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
  }
  String? label;
  String? tag;
  String? schemaOrgTag;
  num? total;
  bool? hasRDI;
  num? daily;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['tag'] = tag;
    map['schemaOrgTag'] = schemaOrgTag;
    map['total'] = total;
    map['hasRDI'] = hasRDI;
    map['daily'] = daily;
    map['unit'] = unit;
    return map;
  }
}

class TotalDaily {
  TotalDaily({
    this.enerckcal,
    this.fat,
    this.fasat,
    this.chocdf,
    this.fibtg,
    this.procnt,
    this.chole,
    this.na,
    this.ca,
    this.mg,
    this.k,
    this.fe,
    this.zn,
    this.p,
    this.vitarae,
    this.vitc,
    this.thia,
    this.ribf,
    this.nia,
    this.vitb6a,
    this.foldfe,
    this.vitb12,
    this.vitd,
    this.tocpha,
    this.vitk1,
  });

  TotalDaily.fromJson(dynamic json) {
    enerckcal = json['ENERC_KCAL'] != null
        ? EnercKcal.fromJson(json['ENERC_KCAL'])
        : null;
    fat = json['FAT'] != null ? Fat.fromJson(json['FAT']) : null;
    fasat = json['FASAT'] != null ? Fasat.fromJson(json['FASAT']) : null;
    chocdf = json['CHOCDF'] != null ? Chocdf.fromJson(json['CHOCDF']) : null;
    fibtg = json['FIBTG'] != null ? Fibtg.fromJson(json['FIBTG']) : null;
    procnt = json['PROCNT'] != null ? Procnt.fromJson(json['PROCNT']) : null;
    chole = json['CHOLE'] != null ? Chole.fromJson(json['CHOLE']) : null;
    na = json['NA'] != null ? Na.fromJson(json['NA']) : null;
    ca = json['CA'] != null ? Ca.fromJson(json['CA']) : null;
    mg = json['MG'] != null ? Mg.fromJson(json['MG']) : null;
    k = json['K'] != null ? K.fromJson(json['K']) : null;
    fe = json['FE'] != null ? Fe.fromJson(json['FE']) : null;
    zn = json['ZN'] != null ? Zn.fromJson(json['ZN']) : null;
    p = json['P'] != null ? P.fromJson(json['P']) : null;
    vitarae =
        json['VITA_RAE'] != null ? VitaRae.fromJson(json['VITA_RAE']) : null;
    vitc = json['VITC'] != null ? Vitc.fromJson(json['VITC']) : null;
    thia = json['THIA'] != null ? Thia.fromJson(json['THIA']) : null;
    ribf = json['RIBF'] != null ? Ribf.fromJson(json['RIBF']) : null;
    nia = json['NIA'] != null ? Nia.fromJson(json['NIA']) : null;
    vitb6a = json['VITB6A'] != null ? Vitb6a.fromJson(json['VITB6A']) : null;
    foldfe = json['FOLDFE'] != null ? Foldfe.fromJson(json['FOLDFE']) : null;
    vitb12 = json['VITB12'] != null ? Vitb12.fromJson(json['VITB12']) : null;
    vitd = json['VITD'] != null ? Vitd.fromJson(json['VITD']) : null;
    tocpha = json['TOCPHA'] != null ? Tocpha.fromJson(json['TOCPHA']) : null;
    vitk1 = json['VITK1'] != null ? Vitk1.fromJson(json['VITK1']) : null;
  }
  EnercKcal? enerckcal;
  Fat? fat;
  Fasat? fasat;
  Chocdf? chocdf;
  Fibtg? fibtg;
  Procnt? procnt;
  Chole? chole;
  Na? na;
  Ca? ca;
  Mg? mg;
  K? k;
  Fe? fe;
  Zn? zn;
  P? p;
  VitaRae? vitarae;
  Vitc? vitc;
  Thia? thia;
  Ribf? ribf;
  Nia? nia;
  Vitb6a? vitb6a;
  Foldfe? foldfe;
  Vitb12? vitb12;
  Vitd? vitd;
  Tocpha? tocpha;
  Vitk1? vitk1;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (enerckcal != null) {
      map['ENERC_KCAL'] = enerckcal?.toJson();
    }
    if (fat != null) {
      map['FAT'] = fat?.toJson();
    }
    if (fasat != null) {
      map['FASAT'] = fasat?.toJson();
    }
    if (chocdf != null) {
      map['CHOCDF'] = chocdf?.toJson();
    }
    if (fibtg != null) {
      map['FIBTG'] = fibtg?.toJson();
    }
    if (procnt != null) {
      map['PROCNT'] = procnt?.toJson();
    }
    if (chole != null) {
      map['CHOLE'] = chole?.toJson();
    }
    if (na != null) {
      map['NA'] = na?.toJson();
    }
    if (ca != null) {
      map['CA'] = ca?.toJson();
    }
    if (mg != null) {
      map['MG'] = mg?.toJson();
    }
    if (k != null) {
      map['K'] = k?.toJson();
    }
    if (fe != null) {
      map['FE'] = fe?.toJson();
    }
    if (zn != null) {
      map['ZN'] = zn?.toJson();
    }
    if (p != null) {
      map['P'] = p?.toJson();
    }
    if (vitarae != null) {
      map['VITA_RAE'] = vitarae?.toJson();
    }
    if (vitc != null) {
      map['VITC'] = vitc?.toJson();
    }
    if (thia != null) {
      map['THIA'] = thia?.toJson();
    }
    if (ribf != null) {
      map['RIBF'] = ribf?.toJson();
    }
    if (nia != null) {
      map['NIA'] = nia?.toJson();
    }
    if (vitb6a != null) {
      map['VITB6A'] = vitb6a?.toJson();
    }
    if (foldfe != null) {
      map['FOLDFE'] = foldfe?.toJson();
    }
    if (vitb12 != null) {
      map['VITB12'] = vitb12?.toJson();
    }
    if (vitd != null) {
      map['VITD'] = vitd?.toJson();
    }
    if (tocpha != null) {
      map['TOCPHA'] = tocpha?.toJson();
    }
    if (vitk1 != null) {
      map['VITK1'] = vitk1?.toJson();
    }
    return map;
  }
}

class Vitk1 {
  Vitk1({
    this.label,
    this.quantity,
    this.unit,
  });

  Vitk1.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Tocpha {
  Tocpha({
    this.label,
    this.quantity,
    this.unit,
  });

  Tocpha.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Vitd {
  Vitd({
    this.label,
    this.quantity,
    this.unit,
  });

  Vitd.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Vitb12 {
  Vitb12({
    this.label,
    this.quantity,
    this.unit,
  });

  Vitb12.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Foldfe {
  Foldfe({
    this.label,
    this.quantity,
    this.unit,
  });

  Foldfe.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Vitb6a {
  Vitb6a({
    this.label,
    this.quantity,
    this.unit,
  });

  Vitb6a.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Nia {
  Nia({
    this.label,
    this.quantity,
    this.unit,
  });

  Nia.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Ribf {
  Ribf({
    this.label,
    this.quantity,
    this.unit,
  });

  Ribf.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Thia {
  Thia({
    this.label,
    this.quantity,
    this.unit,
  });

  Thia.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Vitc {
  Vitc({
    this.label,
    this.quantity,
    this.unit,
  });

  Vitc.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class VitaRae {
  VitaRae({
    this.label,
    this.quantity,
    this.unit,
  });

  VitaRae.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class P {
  P({
    this.label,
    this.quantity,
    this.unit,
  });

  P.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Zn {
  Zn({
    this.label,
    this.quantity,
    this.unit,
  });

  Zn.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Fe {
  Fe({
    this.label,
    this.quantity,
    this.unit,
  });

  Fe.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class K {
  K({
    this.label,
    this.quantity,
    this.unit,
  });

  K.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Mg {
  Mg({
    this.label,
    this.quantity,
    this.unit,
  });

  Mg.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Ca {
  Ca({
    this.label,
    this.quantity,
    this.unit,
  });

  Ca.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Na {
  Na({
    this.label,
    this.quantity,
    this.unit,
  });

  Na.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Chole {
  Chole({
    this.label,
    this.quantity,
    this.unit,
  });

  Chole.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}


class Fibtg {
  Fibtg({
    this.label,
    this.quantity,
    this.unit,
  });

  Fibtg.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}


class Fasat {
  Fasat({
    this.label,
    this.quantity,
    this.unit,
  });

  Fasat.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}


class Water {
  Water({
    this.label,
    this.quantity,
    this.unit,
  });

  Water.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Folac {
  Folac({
    this.label,
    this.quantity,
    this.unit,
  });

  Folac.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Folfd {
  Folfd({
    this.label,
    this.quantity,
    this.unit,
  });

  Folfd.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Sugar {
  Sugar({
    this.label,
    this.quantity,
    this.unit,
  });

  Sugar.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class ChocdfNet {
  ChocdfNet({
    this.label,
    this.quantity,
    this.unit,
  });

  ChocdfNet.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Fapu {
  Fapu({
    this.label,
    this.quantity,
    this.unit,
  });

  Fapu.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Fams {
  Fams({
    this.label,
    this.quantity,
    this.unit,
  });

  Fams.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}

class Fatrn {
  Fatrn({
    this.label,
    this.quantity,
    this.unit,
  });

  Fatrn.fromJson(dynamic json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }
  String? label;
  num? quantity;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['quantity'] = quantity;
    map['unit'] = unit;
    return map;
  }
}
