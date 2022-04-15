// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      name: json['name'] as String,
      imgUrl: json['image_url'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'name': instance.name,
      'image_url': instance.imgUrl,
      'description': instance.description,
    };
