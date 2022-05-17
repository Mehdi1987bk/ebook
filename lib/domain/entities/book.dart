import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/auter.dart';
import 'package:kango/domain/entities/book_cover.dart';

part 'book.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Book {
  Book({
    required this.id,
    required this.slug,
    required this.fileType,
    required this.fileUrl,
    required this.embedCode,
    required this.isbn,
    required this.price,
    required this.publicationYear,
    required this.viewed,
    required this.isFeatured,
    required this.isPrivate,
    required this.isActive,
    required this.authorId,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.publisher,
    required this.author,
    required this.rating,
    required this.bookCover,
    required this.bookFile,
    required this.ordered,
    required this.localPath,
  });


  final int id;
  final String slug;
  final String? fileType;
  final dynamic fileUrl;
  final dynamic embedCode;
  final dynamic isbn;
  final int price;
  final dynamic publicationYear;
  final dynamic viewed;
  final bool isFeatured;
  final bool isPrivate;
  final bool isActive;
  final int authorId;
  final String title;
  final String description;
  final dynamic shortDescription;
  final dynamic publisher;
  final Author? author;
  final dynamic rating;
  final BookCover? bookCover;
  final BookCover? bookFile;
  final bool? ordered;
  final String? localPath;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
