import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/pivot.dart';

part 'file_class.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class FileClass {
  final int id;
  final int userId;
  final String filename;
  final String disk;
  final String path;
  final String extension;
  final String mime;
  final String size;
  final int download;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  FileClass(
      {
  required     this.id,
  required   this.userId,
  required   this.filename,
  required   this.disk,
  required   this.path,
  required   this.extension,
  required   this.mime,
  required   this.size,
  required   this.download,
  required   this.createdAt,
  required   this.updatedAt,
  required   this.pivot});

factory FileClass.fromJson(Map<String, dynamic> json) => _$FileClassFromJson(json);

Map<String, dynamic> toJson() => _$FileClassToJson(this);
}
