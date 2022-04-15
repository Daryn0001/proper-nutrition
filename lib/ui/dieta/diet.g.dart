// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diet _$DietFromJson(Map<String, dynamic> json) => Diet(
      id: json['id'] as int,
      name: json['name'] as String,
      shortDescription: json['short_descrip'] as String,
      moreDescription: json['more_descrip'] as String,
      excluded: json['excluded'] as String,
    );

Map<String, dynamic> _$DietToJson(Diet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_descrip': instance.shortDescription,
      'more_descrip': instance.moreDescription,
      'excluded': instance.excluded,
    };
