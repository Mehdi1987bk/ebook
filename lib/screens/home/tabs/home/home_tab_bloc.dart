import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';

class HomeTabBloc extends BaseBloc{
late final  Future<User> user;
final UserRepository _userRepository = sl.get<UserRepository>();
@override
  void init() {
    super.init();
   user = _userRepository.getUserDetails();
  }
}