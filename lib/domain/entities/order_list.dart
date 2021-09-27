import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/request_packages.dart';
import 'package:kango/domain/entities/user_order_info.dart';
part 'order_list.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class OrderList {
  final int id;
  final int userId;
  final int status;
  final String address;
  final dynamic courierSentAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic handoverBy;
  final List<RequestPackages> requestPackages;
  final UserOrderInfo user;

  OrderList(
      {required this.id,
      required this.userId,
      required this.status,
      required this.address,
      required this.courierSentAt,
      required this.createdAt,
      required this.updatedAt,
      required this.handoverBy,
      required this.requestPackages,
      required this.user
      });

factory OrderList.fromJson(Map<String, dynamic> json) => _$OrderListFromJson(json);

Map<String, dynamic> toJson() => _$OrderListToJson(this);
}
