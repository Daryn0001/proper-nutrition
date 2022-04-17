import 'package:json_annotation/json_annotation.dart';

import 'ingredient.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dish {
  final bool favorite;
  final String title;


  @JsonKey(name: 'diet_id')
  final List<int> dietID;

  @JsonKey(name: 'image_url')
  final String imagePath;

  @JsonKey(name: 'excerpt')
  final String description;

  @JsonKey(name: "power")
  final int numberOfCalories;

  final List<Ingredient> ingredients;
  final String advice;

  @JsonKey(name: 'cooking_method')
  final List<String> cookingMethod;

  Dish(
      this.favorite,
      this.title,
      this.dietID,
      this.imagePath,
      this.description,
      this.numberOfCalories,
      this.ingredients,
      this.advice,
      this.cookingMethod);

  Map<String, String> getIngredients() {
    Map<String, String> map = {};
    for (Ingredient instance in ingredients) {
      String name = instance.name;
      String quantity = instance.quantity.toString();
      switch (instance.type) {
        case 1:
          quantity = '$quantity дана';
          break;
        case 2:
          quantity =  quantity + ' г.';
          break;
        case 3:
          quantity = quantity + ' мл';
          break;
        case 4:
          quantity = 'дәміне қарай';
          break;
      }
      map.addAll({name: quantity});
    }

    return map;
  }

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);

  @override
  String toString() {
    return '{'
        '\n favorite: $favorite'
        '\n title: $title'
        '\n dietID: $dietID'
        '\n imageID: $imagePath'
        '\n description: $description'
        '\n numberOfCalories: $numberOfCalories'
        '\n ingredients: $ingredients'
        '\n advice: $advice'
        '\n cookingMethod: $cookingMethod'
        '\n}';
  }
}
