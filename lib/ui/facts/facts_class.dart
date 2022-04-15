
import 'package:json_annotation/json_annotation.dart';


part 'facts_class.g.dart';

@JsonSerializable()
class Fact {

  final String name;

  @JsonKey(name: 'image_url')
  final String imgUrl;

  @JsonKey(name: 'description')
  final String description;

  Fact({
    required this.name,
    required this.imgUrl,
    required this.description
  });



  factory Fact.fromJson(Map<String, dynamic> json)  => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);

  @override
  String toString() {
    return '{'
        '\nname: $name'
        '\nimgUrl: $imgUrl'
        '\ndescription: $description'
        '\n'
        '}';
  }

}
