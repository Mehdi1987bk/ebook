import 'package:json_annotation/json_annotation.dart';
part 'book_cover.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class BookCover {
  BookCover({
  this.filename,
  this.disk,
 required this.path,
  this.extension,
  this.mime,
  this.size,
  this.download,
  });

final String? filename;
final String? disk;
final String path;
final String? extension;
final String? mime;
final String? size;
final int? download;

factory BookCover.fromJson(Map<String, dynamic> json) => _$BookCoverFromJson(json);

Map<String, dynamic> toJson() => _$BookCoverToJson(this);

}
