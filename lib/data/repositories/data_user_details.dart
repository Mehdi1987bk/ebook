import 'package:kango/data/network/api/user_api.dart';
import 'package:kango/data/network/response/get_user_cart_info.dart';
import 'package:kango/data/network/response/user_details_response.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/main.dart';

class DataUserRepository implements UserRepository {
  final _userApi = sl.get<UserApi>();

  @override
  Future<UserDetailsResponse> getUserDetails() async {
    return _userApi.getUser();
  }

  @override
  Future<GetUserCartInfo> getUserCartInfo() {
   return _userApi.getUserCartInfo();
  }


  @override
  Future<void> createUserCartInfo(GetUserCartInfo request) async {
    final response = await _userApi.createUserCartInfo(request);
    print(response);

  }



}
