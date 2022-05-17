import 'package:json_annotation/json_annotation.dart';

import '../../../main.dart' as main;


part 'login_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginRequest {
  final String email;
  final String password;


  LoginRequest(
      {required this.email,
        required this.password,});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
