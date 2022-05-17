import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/file_class.dart';

part 'available_files.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class AvailableFiles {
  final String extension;
  final String url;
  final String type;
  final String filename;
  final String viewer;
  final FileClass file;

  AvailableFiles(
      {
   required    this.extension,
   required  this.url,
   required  this.type,
   required  this.filename,
   required  this.viewer,
   required  this.file});


factory AvailableFiles.fromJson(Map<String, dynamic> json) => _$AvailableFilesFromJson(json);

Map<String, dynamic> toJson() => _$AvailableFilesToJson(this);
}
