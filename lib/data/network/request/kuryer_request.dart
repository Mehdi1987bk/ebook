import 'package:json_annotation/json_annotation.dart';
part 'kuryer_request.g.dart';
@JsonSerializable()
class KuryerRequest{
  final String address;

  KuryerRequest({required this.address});

factory KuryerRequest.fromJson(Map<String, dynamic> json) => _$KuryerRequestFromJson(json);

Map<String, dynamic> toJson() => _$KuryerRequestToJson(this);
}