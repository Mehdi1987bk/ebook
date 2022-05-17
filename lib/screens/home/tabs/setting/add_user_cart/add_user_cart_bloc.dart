import 'package:kango/presentation/bloc/base_bloc.dart';

import '../../../../../data/network/response/get_user_cart_info.dart';
import '../../../../../domain/repositories/user_repository.dart';
import '../../../../../main.dart';

class AddUserCartBloc extends BaseBloc {
  final UserRepository _authRepository = sl.get<UserRepository>();

  Future<void> login(String expirationYear, String expirationMonth,String number, String cardholderName) {
    return run(_authRepository.createUserCartInfo(GetUserCartInfo(
        expirationYear: expirationYear,
        expirationMonth: expirationMonth,
        number: number,
        cardholderName: cardholderName)));
  }
}
