


import 'package:kango/data/network/response/user_details_response.dart';

import '../../data/network/response/get_user_cart_info.dart';

abstract class UserRepository {
 Future<UserDetailsResponse> getUserDetails();
 Future<GetUserCartInfo> getUserCartInfo();
 Future<void> createUserCartInfo(GetUserCartInfo request);
}