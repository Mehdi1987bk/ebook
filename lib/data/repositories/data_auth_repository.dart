import 'package:kango/data/cache/cache_manager.dart';
import 'package:kango/data/network/api/auth_api.dart';
import 'package:kango/data/network/request/login_request.dart';
import 'package:kango/data/network/response/login_response.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/main.dart';

class DataAuthRepository implements AuthRepository {
  final AuthApi _authApi = sl.get<AuthApi>();
  final CacheManager _cacheManager = sl.get<CacheManager>();

  @override
  Future<void> login(LoginRequest request) async {
    final response = await _authApi.login(request);
    return _saveTokens(response);
  }

  _saveTokens(LoginResponse response) async {
    await _cacheManager.saveAccessToken(response.accessToken);
    await _cacheManager.saveRefreshToken(response.refreshToken);
    return _cacheManager.saveRefreshTokenTime(response.expiresIn);
  }

  @override
  Future<bool> isLogged() async {
    final token = await _cacheManager.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<String> _refreshToken() async {
    return '';
  }

  @override
  Future<String> getToken() async {
    var token = await _cacheManager.getAccessToken();
    if (token == null || token.isEmpty) {
      throw 'Token is null';
    }
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final expireIn = await _cacheManager.getRefreshTokenTime();
    if (expireIn <= currentTime) {
      try {
        token = await _refreshToken();
      } catch (e) {
        logger.e(e);
        throw 'Token is null';
      }
      ;
    }
    return token;
  }
}
