import 'package:intl/intl.dart';
import 'package:kango/data/network/request/registration_reguest.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:kango/screens/registration/page/first_page_info.dart';
import 'package:kango/screens/registration/page/second_page_info.dart';
import 'package:kango/screens/registration/page/third_page_info.dart';

import '../../main.dart';

class RegistrationBloc extends BaseBloc {
  final FirstPageInfo firstPageInfo = FirstPageInfo();
  final SecondPageInfo secondPageInfo = SecondPageInfo();
  final ThirdPageInfo thirdPageInfo = ThirdPageInfo();
  final AuthRepository _authRepository = sl.get<AuthRepository>();
  final dateFormat = DateFormat('dd.MM.yyyy');

  Future<void> registration() {
    return run(_authRepository.registe(RegistrationRequest(
      firstName: firstPageInfo.firstName,
      lastName: firstPageInfo.lastName,
      birthday: dateFormat.format(firstPageInfo.birthday!),
      gender: firstPageInfo.gender!,
      email: firstPageInfo.email,
      mobile: secondPageInfo.dialCode + secondPageInfo.phoneNumber,
      password: secondPageInfo.password,
      passwordConfirmation: secondPageInfo.password,
      passportFin: thirdPageInfo.pasportFin,
      passportNumber: thirdPageInfo.pasportNumber,
      passportSerie: thirdPageInfo.pasportSeria,
      address: thirdPageInfo.address,
    )));
  }
}
