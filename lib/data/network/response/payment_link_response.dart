import 'package:json_annotation/json_annotation.dart';

part 'payment_link_response.g.dart';

@JsonSerializable()
class PaymentLinkResponse {
  final String url;

  PaymentLinkResponse({required this.url});

  factory PaymentLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentLinkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentLinkResponseToJson(this);
}
