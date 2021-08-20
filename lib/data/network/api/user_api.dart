import 'package:dio/dio.dart' hide Headers;
import 'package:kango/data/network/response/user_details_response.dart';

import 'package:kango/domain/entities/user_details.dart';
import 'package:retrofit/retrofit.dart';

import '../../../main.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserApi {
  factory UserApi(Dio dio, {String? baseUrl}) = _UserApi;

  @GET('api/v1.0/mobile/user/auth-detailes')
  Future<UserDetailsResponse> getUser(@Header('Authorization') String token);
}
