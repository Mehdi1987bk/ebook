import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/entities/pagination.dart';

part 'get_author_books_response.g.dart';
@JsonSerializable(explicitToJson: true)
class GetAuthorBooksResponse{
  final List<Book>? ebooks;

  GetAuthorBooksResponse(this.ebooks);

factory GetAuthorBooksResponse.fromJson(Map<String, dynamic> json) => _$GetAuthorBooksResponseFromJson(json);

Map<String, dynamic> toJson() => _$GetAuthorBooksResponseToJson(this);

}