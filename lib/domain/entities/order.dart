import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/order_photos.dart';
import 'package:kango/domain/entities/product_type.dart';

part 'order.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Order {
  Order(
      {required this.id,
      required this.userId,
      required this.packageId,
      required this.shopName,
      required this.link,
      required this.size,
      required this.quantity,
      required this.price,
      required this.cargo,
      required this.trackingCode,
      required this.details,
      required this.orderPhotos,
      required this.productType,
      });

  final int id;
  final int userId;
  final int packageId;
  final String shopName;
  final String? link;
  final dynamic? size;
  final int quantity;
  final String price;
  final String cargo;
  final String trackingCode;
  final String details;
  final List<OrderPhotos> orderPhotos;
  final ProductType productType;



  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
