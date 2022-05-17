import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Category {
  final int id;
  final int? parentId;
  final String slug;
  final dynamic position;
  final bool isSearchable;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;

  final List<Category> items;
   @JsonKey(ignore: true)
   bool subCategory;

// final List<Translation> translations;

  Category({
    required this.id,
    required this.parentId,
    required this.slug,
    required this.position,
    required this.isSearchable,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.items,
     this.subCategory = true,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
