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