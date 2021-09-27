import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/order_list.dart';
import 'package:kango/domain/entities/pagination.dart';

part 'get_order_list_response.g.dart';

@JsonSerializable()
class GetOrderListResponse {
  @JsonKey(name: "CourierOrders")
  final Pagination<OrderList> courierOrders;

  GetOrderListResponse(this.courierOrders);

  factory GetOrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrderListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrderListResponseToJson(this);
}
