import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Order {
  Order({
    required this.id,
    required this.userId,
    required this.packageId,
    required this.shopName,
    this.link,
    this.size,
    required this.quantity,
    this.productType,
    required this.productTypeId,
    this.scGoodsGroupId,
    required this.price,
    required this.priceUsd,
    required this.cargo,
    required this.status,
    this.arriveStatus,
    required this.details,
    required this.box,
    this.externalBox,
    this.externalDeclarationCount,
    required this.trackingCode,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final int id;
  final int userId;
  final int packageId;
  final String shopName;
  final String? link;
  final dynamic size;
  final int quantity;
  final dynamic productType;
  final int productTypeId;
  final dynamic scGoodsGroupId;
  final String price;
  final String priceUsd;
  final String cargo;
  final int status;
  final dynamic arriveStatus;
  final String details;
  final String box;
  final dynamic externalBox;
  final dynamic externalDeclarationCount;
  final String trackingCode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
