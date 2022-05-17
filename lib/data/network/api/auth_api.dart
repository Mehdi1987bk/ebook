import 'package:dio/dio.dart' hide Headers;
import 'package:kango/data/network/request/forgot_password_request.dart';
import 'package:kango/data/network/request/login_request.dart';
import 'package:kango/data/network/request/registration_reguest.dart';
import 'package:kango/data/network/request/update_password_request.dart';
import 'package:kango/data/network/response/get_author_books_response.dart';
import 'package:kango/data/network/response/login_response.dart';
import 'package:kango/data/network/response/register_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../main.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  @POST('api/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST('api/v1.0/mobile/auth/signup')
  Future<RegisterResponse> register(@Body() RegistrationRequest request);


  @POST('api/v1.0/mobile/user/logout')
  Future<void> logout();

  @POST('api/forgot-password')
  Future<void> forgotPassword(
      @Body() ForgotPasswordRequest request);

  @POST('/api/change-password')
  Future<void> editPassword(@Body() UpdatePasswordRequest request,);

  @GET('api/author')
  Future<GetAuthorBooksResponse> getAuthorBooks(@Query('page') int page);
}
