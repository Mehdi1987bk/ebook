import 'package:json_annotation/json_annotation.dart';

part 'packages_counts.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class PackagesCounts {
  PackagesCounts({
  required  this.orders,
  required  this.externalOffice,
  required  this.cargo,
  required  this.bakuOffice,
  required  this.declarations,
  required  this.archive,
  });

final int orders;
final int externalOffice;
final int cargo;
final int bakuOffice;
final int declarations;
final int archive;

factory PackagesCounts.fromJson(Map<String, dynamic> json) => _$PackagesCountsFromJson(json);

Map<String, dynamic> toJson() => _$PackagesCountsToJson(this);
}