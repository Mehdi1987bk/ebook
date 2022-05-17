import 'package:kango/data/network/response/category.dart';
import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/book_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:kango/presentation/bloc/paginable_bloc.dart';

class SubCategoryBloc extends PaginableBloc<Book>{
  final BookRepository bookRepository = sl.get<BookRepository>();
  final Category category;

  SubCategoryBloc(this.category);
  @override
  Future<Pagination<Book>> provideSource(int page) {
    return bookRepository.getBooksByCategory(page,category.slug);
  }

}