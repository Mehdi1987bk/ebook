import 'package:json_annotation/json_annotation.dart';

part 'user_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserDetailsResponse {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final int balance;
  final dynamic about;
  final dynamic facebook;
  final dynamic twitter;
  final dynamic google;
  final dynamic instagram;
  final dynamic linkedin;
  final dynamic youtube;
  final String fullName;
  final dynamic avatar;

  UserDetailsResponse(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.balance,
      required this.about,
      required this.facebook,
      required this.twitter,
      required this.google,
      required this.instagram,
      required this.linkedin,
      required this.youtube,
      required this.fullName,
      required this.avatar});

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsResponseToJson(this);
}
