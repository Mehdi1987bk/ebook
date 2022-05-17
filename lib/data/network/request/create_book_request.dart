import 'package:json_annotation/json_annotation.dart';
import 'dart:io';

part 'create_book_request.g.dart';

@JsonSerializable(explicitToJson: true,fieldRename: FieldRename.snake)
class CreateBookRequest {
  final String title;
  final String language;
  final String description;
  @JsonKey(defaultValue: '')
  final String? shortDescription;
  @JsonKey(defaultValue: '')
  final String? publicationYear;
  @JsonKey(defaultValue: '')
  final String? publisher;
  final int isFree;
  final int? price;
  @JsonKey(defaultValue: '')
  final String? isbn;
  @JsonKey(defaultValue: '')
  final String fileType;
  @JsonKey(defaultValue: '')
  final String? fileUrl;
  @JsonKey(defaultValue: '')
  final String? embedCode;
  final int isPrivate;
  @JsonKey(defaultValue: '')
  final String? passwordProtected;
  @JsonKey(ignore: true)
  final List<int> category;
  @JsonKey(ignore: true)
  final File? bookCover;
  @JsonKey(ignore: true)
  final File? bookFile;

  CreateBookRequest(
      {required this.title,
      required this.language,
      required this.description,
      this.shortDescription,
      this.publicationYear,
      this.publisher,
      this.isFree = 1,
      this.price = 0,
      this.isbn,
      this.fileType = 'upload',
      this.fileUrl,
      this.embedCode,
      this.isPrivate = 0,
      this.passwordProtected,
      this.category = const [],
      this.bookCover,
      this.bookFile});

  factory CreateBookRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBookRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBookRequestToJson(this);
}
