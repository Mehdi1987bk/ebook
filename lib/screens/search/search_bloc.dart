import 'package:kango/domain/entities/book.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/book_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:kango/presentation/bloc/paginable_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends PaginableBloc<Book> {
  final BookRepository _bookRepository = sl.get<BookRepository>();
  final BehaviorSubject<String> _search = BehaviorSubject();

  @override
  void init() {
    super.init();
    _search
        .debounceTime(const Duration(milliseconds: 350))
        .listen((_) => load(refresh: true));
  }

  void onSearch(String text) {
    _search.add(text);
  }

  @override
  Future<Pagination<Book>> provideSource(int page) {
    if (_search.hasValue) {
      return _bookRepository.getSearch(page, _search.value);
    }
    return _bookRepository.getSearch(page, "");
  }
}
