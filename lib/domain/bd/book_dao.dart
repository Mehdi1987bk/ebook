import 'package:floor/floor.dart';
import 'package:kango/domain/entities/book_details.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM BookEntity')
  Stream<List<BookEntity>> getAllBooks();

  @insert
  Future<void> insertBook(BookEntity book);

  // @Query('DELETE FROM BookEntity WHERE id = :id')
  @delete
  Future<void> deleteBook(BookEntity id);


}
