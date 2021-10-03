import 'package:intl/intl.dart';
import 'package:kango/data/network/request/registration_reguest.dart';
import 'package:kango/domain/entities/contact.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/order_repository.dart';
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
  final OrderRepository _orderRepository = sl.get<OrderRepository>();
  final dateFormat = DateFormat('dd.MM.yyyy');
  late final Future<List<Contact>> contactList;

  @override
  init() {
    super.init();
    contactList = _orderRepository.getContactList();
  }

  Future<void> registration() {
    return run(_authRepository.registe(RegistrationRequest(
      firstName: firstPageInfo.firstName,
      lastName: firstPageInfo.lastName,
      birthday: dateFormat.format(firstPageInfo.birthday!),
      gender: firstPageInfo.gender!,
      email: firstPageInfo.email,
      mobile:secondPageInfo.dialCode.substring(1) + secondPageInfo.phoneNumber,
      password: secondPageInfo.password,
      passwordConfirmation: secondPageInfo.password,
      passportFin: thirdPageInfo.pasportFin,
      passportNumber: thirdPageInfo.pasportNumber,
      passportSerie: thirdPageInfo.pasportSeria,
      address: thirdPageInfo.address,
      filialId: thirdPageInfo.fillial!.id,
    )));
  }
}
