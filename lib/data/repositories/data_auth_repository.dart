import 'package:kango/data/cache/cache_manager.dart';
import 'package:kango/data/network/api/auth_api.dart';
import 'package:kango/data/network/request/forgot_password_request.dart';
import 'package:kango/data/network/request/login_request.dart';
import 'package:kango/data/network/request/registration_reguest.dart';
import 'package:kango/data/network/request/update_password_request.dart';
import 'package:kango/data/network/response/get_author_books_response.dart';
import 'package:kango/data/network/response/login_response.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/main.dart';

import '../../domain/entities/book.dart';
import '../../domain/entities/pagination.dart';

class DataAuthRepository implements AuthRepository {
  final AuthApi _authApi = sl.get<AuthApi>();
  final CacheManager _cacheManager = sl.get<CacheManager>();

  @override
  Future<void> login(LoginRequest request) async {
    final response = await _authApi.login(request);
    print(response);

    return _cacheManager.saveAccessToken(response.token);
  }

  @override
  Future<bool> isLogged() async {
    var token = await _cacheManager.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> register(RegistrationRequest request) async {
    final response = await _authApi.register(request);
    await _cacheManager.saveAccessToken(response.token);
  }

  @override
  Future<void> logout() async {
    await _authApi.logout();

    await _cacheManager.clear();
  }

  @override
  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    return _authApi.forgotPassword(request);
  }

  @override
  Future<void> editPassword(UpdatePasswordRequest request) async {
    return _authApi.editPassword(request,);
  }

  @override
  Future<List<Book>?> getAuthorBooks({int page = 1}) async{
   final response = await _authApi.getAuthorBooks(page);
   return response.ebooks;
  }
}
