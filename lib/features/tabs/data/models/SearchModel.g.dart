// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      uri: fields[0] as String?,
      label: fields[1] as String?,
      image: fields[2] as String?,
      // source: fields[3] as String?,
      url: fields[4] as String?,
      shareAs: fields[5] as String?,
      yield: fields[6] as num?,
      dietLabels: (fields[7] as List?)?.cast<String>(),
      healthLabels: (fields[8] as List?)?.cast<String>(),
      cautions: (fields[9] as List?)?.cast<dynamic>(),
      ingredientLines: (fields[10] as List?)?.cast<String>(),
      ingredients: (fields[11] as List?)?.cast<Ingredients>(),
      calories: fields[12] as double?,
      totalWeight: fields[13] as num?,
      totalTime: fields[14] as double?,
      cuisineType: (fields[15] as List?)?.cast<String>(),
      mealType: (fields[16] as List?)?.cast<String>(),
      dishType: (fields[17] as List?)?.cast<String>(),
      totalNutrients: fields[18] as TotalNutrients?,
      totalDaily: fields[19] as TotalDaily?,
      digest: (fields[20] as List?)?.cast<Digest>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.uri)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.source)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.shareAs)
      ..writeByte(6)
      ..write(obj.yield)
      ..writeByte(7)
      ..write(obj.dietLabels)
      ..writeByte(8)
      ..write(obj.healthLabels)
      ..writeByte(9)
      ..write(obj.cautions)
      ..writeByte(10)
      ..write(obj.ingredientLines)
      ..writeByte(11)
      ..write(obj.ingredients)
      ..writeByte(12)
      ..write(obj.calories)
      ..writeByte(13)
      ..write(obj.totalWeight)
      ..writeByte(14)
      ..write(obj.totalTime)
      ..writeByte(15)
      ..write(obj.cuisineType)
      ..writeByte(16)
      ..write(obj.mealType)
      ..writeByte(17)
      ..write(obj.dishType)
      ..writeByte(18)
      ..write(obj.totalNutrients)
      ..writeByte(19)
      ..write(obj.totalDaily)
      ..writeByte(20)
      ..write(obj.digest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IngredientsAdapter extends TypeAdapter<Ingredients> {
  @override
  final int typeId = 1;

  @override
  Ingredients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredients(
      text: fields[0] as String?,
      quantity: fields[1] as num?,
      measure: fields[2] as String?,
      food: fields[3] as String?,
      weight: fields[4] as num?,
      foodCategory: fields[5] as String?,
      foodId: fields[6] as String?,
      image: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredients obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.measure)
      ..writeByte(3)
      ..write(obj.food)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.foodCategory)
      ..writeByte(6)
      ..write(obj.foodId)
      ..writeByte(7)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalNutrientsAdapter extends TypeAdapter<TotalNutrients> {
  @override
  final int typeId = 2;

  @override
  TotalNutrients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalNutrients(
      enerckcal: fields[0] as EnercKcal?,
      fat: fields[1] as Fat?,
      chocdf: fields[2] as Chocdf?,
      procnt: fields[3] as Procnt?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalNutrients obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.enerckcal)
      ..writeByte(1)
      ..write(obj.fat)
      ..writeByte(2)
      ..write(obj.chocdf)
      ..writeByte(3)
      ..write(obj.procnt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalNutrientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnercKcalAdapter extends TypeAdapter<EnercKcal> {
  @override
  final int typeId = 3;

  @override
  EnercKcal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnercKcal(
      label: fields[0] as String?,
      quantity: fields[1] as num?,
      unit: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EnercKcal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnercKcalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProcntAdapter extends TypeAdapter<Procnt> {
  @override
  final int typeId = 4;

  @override
  Procnt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Procnt(
      label: fields[0] as String?,
      quantity: fields[1] as num?,
      unit: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Procnt obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProcntAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FatAdapter extends TypeAdapter<Fat> {
  @override
  final int typeId = 5;

  @override
  Fat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fat(
      label: fields[0] as String?,
      quantity: fields[1] as num?,
      unit: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Fat obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChocdfAdapter extends TypeAdapter<Chocdf> {
  @override
  final int typeId = 6;

  @override
  Chocdf read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chocdf(
      label: fields[0] as String?,
      quantity: fields[1] as num?,
      unit: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Chocdf obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChocdfAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
