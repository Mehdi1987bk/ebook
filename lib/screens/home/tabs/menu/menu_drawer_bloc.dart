
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/order_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';

class DeclarationBloc extends BaseBloc{
  final PublishSubject<User> user = PublishSubject();
  final UserRepository _userRepository = sl.get<UserRepository>();
  @override
  void init() {
    super.init();
    _userRepository.getUserDetails().then(user.add);
  }

}