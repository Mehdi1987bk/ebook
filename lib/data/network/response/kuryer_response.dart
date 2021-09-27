import 'package:json_annotation/json_annotation.dart';
part 'kuryer_response.g.dart';
@JsonSerializable()
class KuryerResponse{
   final String success;

  KuryerResponse({required this.success});

factory KuryerResponse.fromJson(Map<String, dynamic> json) => _$KuryerResponseFromJson(json);

Map<String, dynamic> toJson() => _$KuryerResponseToJson(this);
}