import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/gender.dart';
part 'user_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
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
  final Gender gender;
  final String birthday;
  final String locale;
  final String address;
  final String showRules;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int filialId;
  final String customsLimit;


  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
