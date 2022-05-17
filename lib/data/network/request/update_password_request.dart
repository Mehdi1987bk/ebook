import 'package:json_annotation/json_annotation.dart';

part 'update_password_request.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class UpdatePasswordRequest {
  final String newPasswordConfirmation;
  final String newPassword;
  final String password;

  UpdatePasswordRequest(
      {
        required this.newPasswordConfirmation,
        required this.newPassword,
    required this.password,
  });

factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) => _$UpdatePasswordRequestFromJson(json);

Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);
}
