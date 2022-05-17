import 'package:kango/data/network/request/update_password_request.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';

import '../../../../../main.dart';

class UpdatePasswordBloc extends BaseBloc {
  final AuthRepository _authRepository = sl.get<AuthRepository>();

  Future<void> updatePassword(String passwordNew,String passwordNewTow, String password) {
    return run(_authRepository.editPassword(UpdatePasswordRequest(
        password: password,
        newPassword: passwordNewTow,
        newPasswordConfirmation: passwordNew)));
  }
}
