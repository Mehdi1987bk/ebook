import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';

class SettingBloc extends BaseBloc {
  final PublishSubject<User> user = PublishSubject();
  final UserRepository _userRepository = sl.get<UserRepository>();
  final AuthRepository _authRepository = sl.get<AuthRepository>();

  @override
  void init() {
    super.init();
    _userRepository.getUserDetails().then(user.add);
  }

  Future<void> logout() => run(_authRepository.logout());
}
