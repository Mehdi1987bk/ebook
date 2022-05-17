import 'package:json_annotation/json_annotation.dart';
part 'pivot.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pivot {
  final int entityId;
  final int filesId;
  final String entityType;
  final int id;
  final String zone;
  final DateTime createdAt;
  final DateTime updatedAt;

  Pivot(
      {required this.entityId,
      required this.filesId,
      required this.entityType,
      required this.id,
      required this.zone,
      required this.createdAt,
      required this.updatedAt});

factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

Map<String, dynamic> toJson() => _$PivotToJson(this);
}
