import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  final String name;
  final int type;
  final double quantity;

  Ingredient(this.name, this.type, this.quantity);


  factory Ingredient.fromJson(Map<String,dynamic> json) => _$IngredientFromJson(json);

  Map<String,dynamic> toJson() => _$IngredientToJson(this);




  @override
  String toString(){
    return '\n{\n'
        'name: $name \n type: $type \n quantity: $quantity'
        '\n}';
  }

}