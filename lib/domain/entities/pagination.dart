import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/review.dart';

part 'pagination.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pagination<T> {
  final int currentPage;
  @_Converter()
  final List<T> data;
  final String firstPageUrl;
  final int? from;
  final int lastPage;
  final String lastPageUrl;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int? to;
  final int total;

  Pagination({
    this.currentPage = 0,
    this.data = const [],
    this.firstPageUrl = '',
    this.from,
    this.lastPage = 0,
    this.lastPageUrl = '',
    this.nextPageUrl,
    this.path = '',
    this.perPage = 0,
    this.prevPageUrl,
    this.to,
    this.total = 0,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (T == Book) {
      return Book.fromJson(json as Map<String, dynamic>) as T;
    }
    if (T == Review) {
      return Review.fromJson(json as Map<String, dynamic>) as T;
    }
    throw 'Unknown Pagination type. Type $T';
  }

  @override
  Object toJson(T object) {
    return object as Object;
  }
}
