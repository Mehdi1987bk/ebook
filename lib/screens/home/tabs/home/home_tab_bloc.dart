import 'package:flutter/cupertino.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/data/network/response/user_details_response.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_type.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/book_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeTabBloc extends BaseBloc {
  final BookRepository _productRepository = sl.get<BookRepository>();
  Future<UserDetailsResponse> userDetails =
      sl.get<UserRepository>().getUserDetails();

  late final Stream<List<Category>> categoryList =
      ValueConnectableStream(runStream(_productRepository.getAllCategories))
          .autoConnect();

  late final Stream<Pagination<Book>> relevanceBook = ValueConnectableStream(
          runStream(
              () => _productRepository.booksByType(1, BookType.relevance)))
      .autoConnect();

  late final Stream<Pagination<Book>> topRated = ValueConnectableStream(
          runStream(() => _productRepository.booksByType(1, BookType.topRated)))
      .autoConnect();

  late final Stream<Pagination<Book>> latest = ValueConnectableStream(
          runStream(() => _productRepository.booksByType(1, BookType.latest)))
      .autoConnect();

  late final Future<Locale> currentLocale = cacheManager.getCurrentLocale();

  Future<void> changeCurrentLocale(Locale locale) {
    return cacheManager.setCurrentLocale(locale);
  }
}
