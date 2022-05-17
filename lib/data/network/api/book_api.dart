import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:kango/data/network/request/book_details.dart';
import 'package:kango/data/network/request/send_comment.dart';

import 'package:kango/data/network/response/category.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_type.dart';
import 'package:kango/domain/entities/pagination.dart';

import 'package:retrofit/retrofit.dart';

import '../../../main.dart';
import '../request/add_bookId_request.dart';
import '../response/get_payment_link_response.dart';

part 'book_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class BookApi {
  factory BookApi(Dio dio, {String? baseUrl}) = _BookApi;

  @GET('api/categories')
  Future<List<Category>> getAllCategories();

  @GET('api/ebooks')
  Future<Pagination<Book>> getBooksByCategory(
      @Query('page') int page, @Query('category') String category);

  @GET('api/ebooks/{id}')
  Future<BookDetails> getBooksDetails(
    @Path('id') String id, @Query('reviews') int reviewPage
  );

  @GET('api/ebooks')
  Future<Pagination<Book>> getBookByType(
      @Query('page') int page, @Query('sort') String type);

  @GET('api/search')
  Future<Pagination<Book>> getSearch(
      @Query('page') int page, @Query('query') String query);

  @GET('api/order/{id}')
  Future<GetPaymentLinkResponse> getPaymentLink(@Path('id') String id);

  @DELETE('api/dbook/{id}')
  Future<void> deleteSavedBook(@Path('id') int id);
  
  @POST('api/ebook/review/{id}')
  Future<void> sendComment(@Path('id') int id,@Body() SendCommentRequest request);

  @POST('api/dbook')
  Future<void> addBookRead(@Body() AddBookIdRequest request);

  @POST('api/ebooks')
  Future<void> createBook(
    @Part(name: 'title') String title,
    @Part(name: 'language') String language,
    @Part(name: 'description') String description,
    @Part(name: 'publication_year') String? publicationYear,
    @Part(name: 'publisher') String? publisher,
    @Part(name: 'is_free') int isFree,
    @Part(name: 'price') String? price,
    @Part(name: 'isbn') String? isbn,
    @Part(name: 'file_type') String? fileType,
    @Part(name: 'file_url') String? fileUrl,
    @Part(name: 'embed_code') String? embedCode,
    @Part(name: 'is_private') String? isPrivate,
    @Part(name: 'password_protected') String? passwordProtected,
    @Part(name: 'short_description') String? shortDescription,
    @Part(name: 'categories[0]') int category,
    @Part(name: 'categories[1]') int subCategory,
    @Part(name: 'book_cover') File bookCover,
    @Part(name: 'book_file') File bookFile,
  );
}

