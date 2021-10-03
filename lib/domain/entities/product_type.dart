import 'package:json_annotation/json_annotation.dart';
part 'product_type.g.dart';
@JsonSerializable()
class ProductType {
  final int id;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductType({required this.id,required this.name,required this.createdAt,required this.updatedAt});

factory ProductType.fromJson(Map<String, dynamic> json) => _$ProductTypeFromJson(json);

Map<String, dynamic> toJson() => _$ProductTypeToJson(this);
}
