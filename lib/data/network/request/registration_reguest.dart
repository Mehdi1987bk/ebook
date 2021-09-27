import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/gender.dart';

part 'registration_reguest.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegistrationRequest {
  final String firstName;
  final String lastName;
  final String birthday;
  final Gender gender;
  final String email;
  final String mobile;
  final String passportSerie;
  final String passportNumber;
  final String passportFin;
  final String password;
  final String passwordConfirmation;
  final String address;

  RegistrationRequest({
    required  this.firstName,
    required  this.lastName,
    required  this.birthday,
    required  this.gender,
    required  this.email,
    required  this.mobile,
    required  this.passportSerie,
    required  this.passportNumber,
    required  this.passportFin,
    required  this.password,
    required  this.passwordConfirmation,
    required  this.address});

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestToJson(this);
}
