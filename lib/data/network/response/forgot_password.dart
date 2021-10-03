import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forgot_password.g.dart';
@JsonSerializable()
@JsonSerializable(explicitToJson: true)
class ForgotPasswordResponse{
  final String success;

  ForgotPasswordResponse(this.success);

factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);

Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);

}