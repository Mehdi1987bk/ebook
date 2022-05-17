import 'package:json_annotation/json_annotation.dart';

part 'get_user_cart_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GetUserCartInfo {
  final int? id;
  final String number;
  final String cardholderName;
  final String expirationMonth;
  final String expirationYear;
  final String? userTd;
  final String? createdAt;
  final String? updatedAt;

  GetUserCartInfo({
     this.id,
    required this.number,
   required this.cardholderName,
   required this.expirationMonth,
   required this.expirationYear,
    this.userTd,
    this.createdAt,
    this.updatedAt,
  });

  factory GetUserCartInfo.fromJson(Map<String, dynamic> json) =>
      _$GetUserCartInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserCartInfoToJson(this);
}
