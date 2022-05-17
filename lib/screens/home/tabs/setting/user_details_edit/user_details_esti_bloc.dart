// import 'package:intl/intl.dart';
// import 'package:kango/data/network/request/edit_user_details_request.dart';
// import 'package:kango/data/network/response/user_details_response.dart';
// import 'package:kango/domain/repositories/auth_repository.dart';
// import 'package:kango/domain/repositories/user_repository.dart';
// import 'package:kango/presentation/bloc/base_bloc.dart';
// import 'package:kango/presentation/common/user_details_screen.dart';
//
// import '../../../../../main.dart';
// import 'edit_page_info.dart';
//
// class UserDetailsEditBloc extends BaseBloc {
//   final _userRepository = sl.get<UserRepository>();
//   final EditPageInfo editPageInfo = EditPageInfo();
//   final AuthRepository _authRepository = sl.get<AuthRepository>();
//   late final Future<List<Contact>> contactList;
//   final dateFormat = DateFormat('dd.MM.yyyy');
//
//   late final Future<UserDetailsResponse> userDetails = run(_userRepository.getUserDetails());
//
//   Future<void> registration() {
//     return run(_authRepository.editUserDetails(EditUserDetailsRequest(
//       birthday: dateFormat.format(editPageInfo.birthday!),
//       gender: editPageInfo.gender!,
//       mobile: editPageInfo.phoneNumber,
//       passportNumber: editPageInfo.pasportNumber,
//       passportSerie: editPageInfo.pasportSeria,
//       address: editPageInfo.adress,
//     )));
//   }
// }
