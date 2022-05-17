import 'package:kango/data/network/request/book_details.dart';
import 'package:kango/data/network/request/send_comment.dart';
import 'package:kango/data/network/response/category.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_type.dart';
import 'package:kango/domain/entities/pagination.dart';

import '../../data/network/request/add_bookId_request.dart';
import '../../data/network/request/create_book_request.dart';
import '../entities/book_details.dart';

abstract class BookRepository {
  Future<List<Category>> getAllCategories();
  Future<Pagination<Book>> booksByType(int page,BookType type);
  Future<Pagination<Book>> getBooksByCategory(int page, String category);
  Future<BookDetails> getBooksDetails(String id,int reviewPage);
  Future<Pagination<Book>> getSearch(int page, String query);
  Future<String> getPaymentUrl(String id);
  Future<void> deleteSavedBook(BookEntity id);
  Stream<List<BookEntity>>  getSavedBooks();
  Future<void>  createBook(CreateBookRequest request);
  Future<void>  addBookRead(AddBookIdRequest id);
  Future<void>  sendComment(SendCommentRequest request,int id);
 }
