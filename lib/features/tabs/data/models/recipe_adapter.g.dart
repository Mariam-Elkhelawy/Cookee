// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<RecipeA> {
  @override
  final int typeId = 0;

  @override
  RecipeA read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeA(
      label: fields[0] as String?,
      image: fields[1] as String?,
      url: fields[2] as String?,
      calories: fields[3] as double?,
      totalNutrients: fields[4] as TotalNutrients?,
      ingredients: (fields[5] as List?)?.cast<Ingredient>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeA obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.calories)
      ..writeByte(4)
      ..write(obj.totalNutrients)
      ..writeByte(5)
      ..write(obj.ingredients);
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

class TotalNutrientsAdapter extends TypeAdapter<TotalNutrients> {
  @override
  final int typeId = 1;

  @override
  TotalNutrients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalNutrients(
      procnt: fields[0] as Nutrient?,
      fat: fields[1] as Nutrient?,
      chocdf: fields[2] as Nutrient?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalNutrients obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.procnt)
      ..writeByte(1)
      ..write(obj.fat)
      ..writeByte(2)
      ..write(obj.chocdf);
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

class NutrientAdapter extends TypeAdapter<Nutrient> {
  @override
  final int typeId = 2;

  @override
  Nutrient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrient(
      quantity: fields[0] as double?,
      unit: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrient obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quantity)
      ..writeByte(1)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutrientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 3;

  @override
  Ingredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredient(
      text: fields[0] as String?,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
