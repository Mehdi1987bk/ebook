import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/user_details.dart';

part 'user_details_response.g.dart';
@JsonSerializable(explicitToJson: true)
class UserDetailsResponse{
  final User user;

  UserDetailsResponse(this.user);

factory UserDetailsResponse.fromJson(Map<String, dynamic> json) => _$UserDetailsResponseFromJson(json);

Map<String, dynamic> toJson() => _$UserDetailsResponseToJson(this);
}