import 'package:kango/domain/bd/book_dao.dart';
import 'package:kango/domain/entities/book_details.dart';
import 'package:kango/domain/repositories/book_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';

class SavedBooksBloc extends BaseBloc {
  final bookRepository = sl.get<BookRepository>();
  late final Stream<List<BookEntity>> books = bookRepository.getSavedBooks();

 Future<void> deleteBook(BookEntity book) {
    return bookRepository.deleteSavedBook(book);
  }
}
