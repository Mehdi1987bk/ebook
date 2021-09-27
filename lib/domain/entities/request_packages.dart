import 'package:json_annotation/json_annotation.dart';

part 'request_packages.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestPackages {
  final int id;
  final int courierRequestId;
  final int packageId;
  final int packageStatus;
  final dynamic box;

  RequestPackages(
      {required this.id,
      required this.courierRequestId,
      required this.packageId,
      required this.packageStatus,
      required this.box});

  factory RequestPackages.fromJson(Map<String, dynamic> json) =>
      _$RequestPackagesFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPackagesToJson(this);
}
