import 'package:kango/data/network/request/login_request.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';

class LoginBloc extends BaseBloc{
  final AuthRepository _authRepository = sl.get<AuthRepository>();
  Future<void> login(String email, String password) {
   return  run(_authRepository.login(LoginRequest(email: email,password: password)));

  }
}
