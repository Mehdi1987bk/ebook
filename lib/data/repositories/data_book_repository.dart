import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kango/data/network/api/book_api.dart';
import 'package:kango/data/network/request/book_details.dart';
import 'package:kango/data/network/request/create_book_request.dart';
import 'package:kango/data/network/request/send_comment.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_details.dart';
import 'package:kango/domain/entities/book_type.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/book_repository.dart';

import '../../domain/bd/book_dao.dart';
import '../../main.dart';
import '../network/request/add_bookId_request.dart';

class DataBookRepository implements BookRepository {
  final _bookApi = sl.get<BookApi>();
  final bookDao = sl.get<BookDao>();
  final  _dio = sl.get<Dio>();

  @override
  Future<List<Category>> getAllCategories() {
    return _bookApi.getAllCategories();
  }

  @override
  Future<Pagination<Book>> getBooksByCategory(int page, String category) {
    return _bookApi.getBooksByCategory(page, category);
  }

  @override
  Future<BookDetails> getBooksDetails(String id,int reviewPage) {
    return _bookApi.getBooksDetails(id,reviewPage);
  }

  @override
  Future<Pagination<Book>> booksByType(int page, BookType type) {
    return _bookApi.getBookByType(page, type.name);
  }

  @override
  Future<Pagination<Book>> getSearch(int page, String query) {
    return _bookApi.getSearch(page, query);
  }

  @override
  Future<String> getPaymentUrl(String id) async {
    final response = await _bookApi.getPaymentLink(id);
    return response.url;
  }

  @override
  Future<void> deleteSavedBook(BookEntity book) {
    return _bookApi
        .deleteSavedBook(book.id)
        .then((value) async{
          final file = File(book.bookPath);
          if(await file.exists()){
           await file.delete();
          }
           await bookDao.deleteBook(book);
        });
  }

  @override
  Stream<List<BookEntity>> getSavedBooks() {
    return bookDao.getAllBooks();
  }

  @override
  Future<void> createBook(CreateBookRequest request) async{
    // return _bookApi.createBook(
    //     request.title,
    //     request.language,
    //     request.description,
    //     request.publicationYear,
    //     request.publisher,
    //     request.isFree,
    //     request.price,
    //     request.isbn,
    //     request.fileType,
    //     request.fileUrl,
    //     request.embedCode,
    //     request.isPrivate,
    //     request.passwordProtected,
    //     request.shortDescription,
    //     request.category,
    //     request.subCategory,
    //     request.bookCover,
    //     request.bookFile
    // );
    final data = FormData();
    request.toJson().forEach((key, value) {
      if(value != null ){
        data.fields.add(MapEntry(key, value.toString()));
      }else{
        data.fields.add(MapEntry(key, ''));
      }
    });

    data.files.add(MapEntry(
        'book_cover',
        MultipartFile.fromFileSync(request.bookCover!.path,
        filename: request.bookCover!.path.split(Platform.pathSeparator).last)));
    data.files.add(MapEntry(
    'book_file',
    MultipartFile.fromFileSync(request.bookFile!.path,
    filename: request.bookFile!.path.split(Platform.pathSeparator).last)));
    for(int i = 0 ; i < request.category.length; i++) {
      data.fields.add(MapEntry('categories[$i]', request.category[i].toString()));
    }
    print(data.fields.toString());
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'POST',)
            .compose(_dio.options, 'api/ebooks',
           data: data)
            .copyWith(baseUrl: baseUrl)));
    return null;

  }


  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }


  @override
  Future<void> addBookRead(AddBookIdRequest id) {
    return _bookApi.addBookRead(id);
  }

  @override
  Future<void> sendComment(SendCommentRequest request, int id) {
    return _bookApi.sendComment(id, request);

  }
}
