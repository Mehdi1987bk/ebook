import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/available_files.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/pagination.dart';

import '../../../domain/entities/review.dart';

part 'book_details.g.dart';

@JsonSerializable()
class BookDetails {
  final Book ebook;
  final Pagination<Review> reviews;
  final List<Book> relatedEbooks;
  final List<AvailableFiles> availableFiles;
  final int? unlock;

  BookDetails(
      {required this.ebook,
      required this.reviews,
      required this.relatedEbooks,
      required this.availableFiles,
      required this.unlock});

  factory BookDetails.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailsToJson(this);
}
