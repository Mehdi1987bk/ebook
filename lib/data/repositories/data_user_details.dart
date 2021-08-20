import 'package:kango/data/network/api/user_api.dart';
import 'package:kango/domain/entities/user_details.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/main.dart';

class DataUserRepository implements UserRepository {
  final _authRepository = sl.get<AuthRepository>();
  final _userApi = sl.get<UserApi>();

  @override
  Future<User> getUserDetails() async {
    final token = await _authRepository.getToken();
    final response = await _userApi.getUser('Bearer $token');
    return response.user;
  }
}
