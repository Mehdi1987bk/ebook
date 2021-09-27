import 'package:json_annotation/json_annotation.dart';
part 'user_order_info.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class UserOrderInfo {
  final int id;
  final int roleId;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String passportSerie;
  final String passportNumber;
  final String passportFin;
  final String hasPhoto;
  final String gender;
  final String birthday;
  final String locale;
  final String address;
  final String showRules;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int filialId;
  final String customsLimit;

  UserOrderInfo(
      this.id,
      this.roleId,
      this.email,
      this.firstName,
      this.lastName,
      this.mobile,
      this.passportSerie,
      this.passportNumber,
      this.passportFin,
      this.hasPhoto,
      this.gender,
      this.birthday,
      this.locale,
      this.address,
      this.showRules,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.filialId,
      this.customsLimit);

factory UserOrderInfo.fromJson(Map<String, dynamic> json) => _$UserOrderInfoFromJson(json);

Map<String, dynamic> toJson() => _$UserOrderInfoToJson(this);
}
