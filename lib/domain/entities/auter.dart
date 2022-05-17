import 'package:json_annotation/json_annotation.dart';
part 'auter.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Author {
  Author({
    required this.slug,
    required this.name,
    required this.description,
  });

  final String slug;
  final String name;
  final String? description;


factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
