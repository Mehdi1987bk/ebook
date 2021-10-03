import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';
@JsonSerializable(explicitToJson: true)
class RegisterResponse{
final  String token;
// final  User user;

  RegisterResponse(this.token, );

factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json['success']);

Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}