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
          quantity = '$quantity шт.';
          break;
        case 2:
          quantity =  quantity + ' г.';
          break;
        case 3:
          quantity = quantity + ' мл';
          break;
        case 4:
          quantity = 'по вкусу';
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

/*
class Dish {
  bool? _favorite;
  String? _title;
  int? _categoryId;
  int? _dietId;
  int? _imageId;
  String? _excerpt;
  String? _power;
  List<Ingredient>? _ingredient;
  List<String>? _cookingMethod;
  String? _advice;

  Dish(
      {bool? favorite,
        String? title,
        int? categoryId,
        int? dietId,
        int? imageId,
        String? excerpt,
        String? power,
        List<Ingredient>? ingredient,
        List<String>? cookingMethod,
        String? advice}) {
    if (favorite != null) {
      _favorite = favorite;
    }
    if (title != null) {
      _title = title;
    }
    if (categoryId != null) {
      _categoryId = categoryId;
    }
    if (dietId != null) {
      _dietId = dietId;
    }
    if (imageId != null) {
      _imageId = imageId;
    }
    if (excerpt != null) {
      _excerpt = excerpt;
    }
    if (power != null) {
      _power = power;
    }
    if (ingredient != null) {
      _ingredient = ingredient;
    }
    if (cookingMethod != null) {
      _cookingMethod = cookingMethod;
    }
    if (advice != null) {
      _advice = advice;
    }
  }

  bool? get favorite => _favorite;
  set favorite(bool? favorite) => _favorite = favorite;
  String? get title => _title;
  set title(String? title) => _title = title;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  int? get dietId => _dietId;
  set dietId(int? dietId) => _dietId = dietId;
  int? get imageId => _imageId;
  set imageId(int? imageId) => _imageId = imageId;
  String? get excerpt => _excerpt;
  set excerpt(String? excerpt) => _excerpt = excerpt;
  String? get power => _power;
  set power(String? power) => _power = power;
  List<Ingredient>? get ingredient => _ingredient;
  set ingredient(List<Ingredient>? ingredient) => _ingredient = ingredient;
  List<String>? get cookingMethod => _cookingMethod;
  set cookingMethod(List<String>? cookingMethod) =>
      _cookingMethod = cookingMethod;
  String? get advice => _advice;
  set advice(String? advice) => _advice = advice;

  Dish.fromJson(Map<String, dynamic> json) {
    _favorite = json['favorite'];
    _title = json['title'];
    _categoryId = json['category_id'];
    _dietId = json['diet_id'];
    _imageId = json['image_id'];
    _excerpt = json['excerpt'];
    _power = json['power'];
    if (json['ingredient'] != null) {
      _ingredient = <Ingredient>[];
      json['ingredient'].forEach((v) {
        _ingredient!.add(Ingredient.fromJson(v));
      });
    }
    _cookingMethod = json['cooking_method'].cast<String>();
    _advice = json['advice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite'] = _favorite;
    data['title'] = _title;
    data['category_id'] = _categoryId;
    data['diet_id'] = _dietId;
    data['image_id'] = _imageId;
    data['excerpt'] = _excerpt;
    data['power'] = _power;
    if (_ingredient != null) {
      data['ingredient'] = _ingredient!.map((v) => v.toJson()).toList();
    }
    data['cooking_method'] = _cookingMethod;
    data['advice'] = _advice;
    return data;
  }
}

class Ingredient {
  String? _name;
  int? _type;
  int? _quantity;

  Ingredient({String? name, int? type, int? quantity}) {
    if (name != null) {
      _name = name;
    }
    if (type != null) {
      _type = type;
    }
    if (quantity != null) {
      _quantity = quantity;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  int? get type => _type;
  set type(int? type) => _type = type;
  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;

  Ingredient.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _type = json['type'];
    _quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['type'] = _type;
    data['quantity'] = _quantity;
    return data;
  }
}*/
