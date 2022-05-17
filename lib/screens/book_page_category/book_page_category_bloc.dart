import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/book_type.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/book_repository.dart';
import 'package:kango/presentation/bloc/paginable_bloc.dart';

import '../../main.dart';

class BookPageCategoryBloc extends PaginableBloc<Book>{
  final BookRepository _productRepository = sl.get<BookRepository>();
  final BookType bookType;

  BookPageCategoryBloc(this.bookType);

  @override
  Future<Pagination<Book>> provideSource(int page) {
   return   _productRepository.booksByType(1, bookType);
  }


}