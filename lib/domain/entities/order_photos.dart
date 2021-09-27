import 'package:json_annotation/json_annotation.dart';
part 'order_photos.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class OrderPhotos {
  OrderPhotos({
    required this.id,
    required this.packageId,
    required this.orderId,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

final int id;
final dynamic packageId;
final int orderId;
final String photo;
final DateTime createdAt;
final DateTime updatedAt;
final dynamic deletedAt;

factory OrderPhotos.fromJson(Map<String, dynamic> json) => _$OrderPhotosFromJson(json);

Map<String, dynamic> toJson() => _$OrderPhotosToJson(this);
}
