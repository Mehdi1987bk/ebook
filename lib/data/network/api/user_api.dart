import 'package:dio/dio.dart' hide Headers;
import 'package:kango/data/network/response/user_details_response.dart';

import 'package:retrofit/retrofit.dart';

import '../../../main.dart';
import '../response/get_user_cart_info.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserApi {
  factory UserApi(Dio dio, {String? baseUrl}) = _UserApi;

  @GET('api/get_user')
  Future<UserDetailsResponse> getUser();

  @GET('api/account/card')
  Future<GetUserCartInfo> getUserCartInfo();

  @POST('api/account/card')
  Future<GetUserCartInfo> createUserCartInfo(@Body() GetUserCartInfo request);

}
