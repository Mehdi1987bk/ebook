import 'package:hive_flutter/adapters.dart';
import 'package:kango/data/cache/cache_manager.dart';

const _authCache = 'AuthCache';

const _refreshTokenKey = 'RefreshTokenKey';
const _accessTokenKey = 'AccessTokenKey';
const _refreshTokenTime = 'RefreshTokenTime';

class DataCacheManager implements CacheManager {
  Future<Box> authBox = Hive.openBox(_authCache);

  @override
  Future<String?> getAccessToken() async {
    final box = await authBox;
    return box.get(_accessTokenKey);
  }

  @override
  Future<void> saveAccessToken(String token) async {
    final box = await authBox;
    return box.put(_accessTokenKey, token);
  }

  @override
  Future<int> getRefreshTokenTime() async {
    final box = await authBox;
    return box.get(_refreshTokenTime, defaultValue: 0);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    final box = await authBox;
    return box.put(_refreshTokenKey, token);
  }

  @override
  Future<String?> getRefreshToken() async {
    final box = await authBox;
    return box.get(_refreshTokenKey);
  }

  @override
  Future<void> saveRefreshTokenTime(int expiresIn) async {
    final box = await authBox;
    return box.put(_refreshTokenTime,DateTime.now().millisecondsSinceEpoch + expiresIn);
  }

  @override
  Future<void> clear() async{
    final box = await authBox;
    await box.clear();
  }


}
