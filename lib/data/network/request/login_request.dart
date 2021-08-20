import 'package:json_annotation/json_annotation.dart';

import '../../../main.dart' as main;


part 'login_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginRequest {
  final String username;
  final String password;
  final String clientSecret;
  final String grantType;
  final int clientId;

  LoginRequest(
      {required this.username,
      required this.password,
      this.clientSecret = main.clientSecret,
      this.grantType = main.granyType,
      this.clientId = main.clientId});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
