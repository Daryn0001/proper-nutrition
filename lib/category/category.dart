
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String title;
  final String imgUrl;
  final int type;

  Category(this.title, this.imgUrl, this.type);

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  String toString() {
    return '{\ntitle: $title'
        '\ntype: $type'
        '\nimgUrl: $imgUrl\n}';
  }

}
