import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';

class SettingBloc extends BaseBloc {
  final UserRepository _userRepository = sl.get<UserRepository>();
  final AuthRepository _authRepository = sl.get<AuthRepository>();


  Future<void> logout() => run(_authRepository.logout());
}
