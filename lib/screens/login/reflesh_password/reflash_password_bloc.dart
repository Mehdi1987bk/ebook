import 'package:kango/data/network/request/forgot_password_request.dart';
import 'package:kango/data/network/request/login_request.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';

import '../../../main.dart';

class ReflashPasswordBloc extends BaseBloc{

  final AuthRepository _authRepository = sl.get<AuthRepository>();
  Future<void> forgot(String email) {
    return  run(_authRepository.forgotPassword(ForgotPasswordRequest(email: email)));

  }}