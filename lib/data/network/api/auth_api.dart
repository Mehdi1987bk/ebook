import 'package:dio/dio.dart' hide Headers;
import 'package:kango/data/network/request/forgot_password_request.dart';
import 'package:kango/data/network/request/login_request.dart';
import 'package:kango/data/network/request/registration_reguest.dart';
import 'package:kango/data/network/response/forgot_password.dart';
import 'package:kango/data/network/response/login_response.dart';
import 'package:kango/data/network/response/register_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../main.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  // @GET('oauth/token')
  // Future<List<String>> getTags(
  //     @Header('optionalHeader') String optionalHeader);

  @POST('oauth/token')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST('api/v1.0/mobile/auth/signup')
  Future<RegisterResponse> register(@Body() RegistrationRequest request);

  @POST('api/v1.0/mobile/user/logout')
  Future<void> logout(@Header('Authorization') String token);

  @POST('api/v1.0/mobile/password/email')
  Future<ForgotPasswordResponse> forgotPassword(@Body() ForgotPasswordRequest request);
}
