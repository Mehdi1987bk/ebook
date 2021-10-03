import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/gender.dart';
part 'user_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@HiveType(typeId: 1)
class User{
  User({
    required this.id,
    required this.roleId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.passportSerie,
    required this.passportNumber,
    required this.passportFin,
    required this.hasPhoto,
    required this.gender,
    required this.birthday,
    required this.locale,
    required this.address,
    required this.showRules,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.filialId,
    required this.customsLimit,
  });
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int roleId;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String firstName;
  @HiveField(4)
  final String lastName;
  @HiveField(5)
  final String mobile;
  @HiveField(6)
  final String passportSerie;
  @HiveField(7)
  final String passportNumber;
  @HiveField(8)
  final String passportFin;
  @HiveField(9)
  final String? hasPhoto;
  @HiveField(10)
  final Gender gender;
  @HiveField(11)
  final String birthday;
  @HiveField(12)
  final String locale;
  @HiveField(13)
  final String address;
  @HiveField(14)
  final String? showRules;
  @HiveField(15)
  final DateTime? emailVerifiedAt;
  @HiveField(16)
  final DateTime createdAt;
  @HiveField(17)
  final DateTime updatedAt;
  @HiveField(18)
  final int? filialId;
  @HiveField(19)
  final String? customsLimit;
  @HiveField(20)


  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
