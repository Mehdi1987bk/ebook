import 'package:json_annotation/json_annotation.dart';
part 'get_payment_link_request.g.dart';
@JsonSerializable()
class GetPaymentLinkRequest {
  final int amount;

  GetPaymentLinkRequest({required this.amount});

factory GetPaymentLinkRequest.fromJson(Map<String, dynamic> json) => _$GetPaymentLinkRequestFromJson(json);

Map<String, dynamic> toJson() => _$GetPaymentLinkRequestToJson(this);
}
