
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponse{
  final bool success;
  final String token;


  LoginResponse(this.success, this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}