// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      json['favorite'] as bool,
      json['title'] as String,
      (json['diet_id'] as List<dynamic>).map((e) => e as int).toList(),
      json['image_url'] as String,
      json['excerpt'] as String,
      json['power'] as int,
      (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['advice'] as String,
      (json['cooking_method'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'favorite': instance.favorite,
      'title': instance.title,
      'diet_id': instance.dietID,
      'image_url': instance.imagePath,
      'excerpt': instance.description,
      'power': instance.numberOfCalories,
      'ingredients': instance.ingredients,
      'advice': instance.advice,
      'cooking_method': instance.cookingMethod,
    };
