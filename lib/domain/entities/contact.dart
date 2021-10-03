import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class Contact {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String body;
  final int? order;
  final String? phone;
  final String? email;
  final String? workDays;
  final String? workDaysSaturday;
  final String? map;
  final String? mapLatitude;
  final String? mapLongitude;
  final String? type;
  final String? image;

  Contact(
      this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.body,
      this.order,
      this.phone,
      this.email,
      this.workDays,
      this.workDaysSaturday,
      this.map,
      this.mapLatitude,
      this.mapLongitude,
      this.type,
      this.image);

factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

Map<String, dynamic> toJson() => _$ContactToJson(this);
}
