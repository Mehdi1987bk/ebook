import 'package:flutter/cupertino.dart';

abstract class CacheManager {
  Future<void> saveAccessToken(String token);

  Future<String?> getAccessToken();

  Future<void> saveRefreshToken(String token);

  Future<String?> getRefreshToken();

  Future<void> saveRefreshTokenTime(int expiresIn);

  Future<void> clear();

  Future<int> getRefreshTokenTime();

  Future<Locale> getCurrentLocale();

  Future<void> setCurrentLocale(Locale locale);

  Stream<Locale> observeLocal();

}
