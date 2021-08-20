import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/order_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:kango/presentation/bloc/paginable_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';

class DeclarationBloc extends PaginableBloc<Declaration>{
  final PublishSubject<User> user = PublishSubject();
  final UserRepository _userRepository = sl.get<UserRepository>();
  final OrderRepository _orderRepository = sl.get<OrderRepository>();
  @override
  void init() {
    super.init();
    _userRepository.getUserDetails().then(user.add);
  }

  @override
  Future<Pagination<Declaration>> provideSource(int page) {
   return _orderRepository.getDeclarations(page);
  }
}