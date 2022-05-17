import 'package:kango/data/network/response/user_details_response.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';

import '../../../../domain/entities/book.dart';
import '../../../../domain/entities/book_type.dart';
import '../../../../domain/entities/pagination.dart';
import '../../../../domain/repositories/book_repository.dart';
import '../../../../main.dart';
import '../../../../presentation/bloc/paginable_bloc.dart';

class UserDetailsBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();
  late final Future<List<Book>> books;

  Future<UserDetailsResponse> userDetails =
      sl.get<UserRepository>().getUserDetails();

  @override
  void init() {
    super.init();
    books =
        _authRepository.getAuthorBooks(page: 1).then((value) => value ?? []);
  }
}
