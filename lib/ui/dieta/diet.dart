
import 'package:json_annotation/json_annotation.dart';


part 'diet.g.dart';

@JsonSerializable()
class Diet {
  final int id;
  final String name;
  @JsonKey(name: 'short_descrip')
  final String shortDescription;

  @JsonKey(name: 'more_descrip')
  final String moreDescription;

  @JsonKey(name: 'excluded')
  final String excluded;

  Diet({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.moreDescription,
    required this.excluded,
  });


  factory Diet.fromJson(Map<String, dynamic> json) => _$DietFromJson(json);


  Map<String, dynamic> toJson() => _$DietToJson(this);


  @override
  String toString(){
    return '{'
        '\nid: $id'
        '\nname: $name'
        '\nshortDescription: $shortDescription'
        '\nmoreDescription: $moreDescription'
        '\nexcluded: $excluded'
        '\n}';
  }

}
