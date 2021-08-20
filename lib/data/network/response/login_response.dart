
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponse{
final String tokenType;
final int expiresIn;
final String accessToken;
final String refreshToken;

LoginResponse(this.tokenType, this.expiresIn, this.accessToken, this.refreshToken);

factory LoginResponse.fromJson(Map<String, dynamic> json) =>
    _$LoginResponseFromJson(json);

Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}