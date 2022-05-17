import 'dart:async';
import 'dart:ui';

import 'package:hive_flutter/adapters.dart';
import 'package:kango/data/cache/cache_manager.dart';

const _authCache = 'AuthCache';
const _userCache = 'UserCache';
const _settingsCache = 'SettingsCache';

const _refreshTokenKey = 'RefreshTokenKey';
const _accessTokenKey = 'AccessTokenKey';
const _refreshTokenTime = 'RefreshTokenTime';
const _localeKey = 'LocaleKey';

class DataCacheManager implements CacheManager {
  final Future<Box> _authBox = Hive.openBox(_authCache);
  final Future<Box> _userBox = Hive.openBox(_userCache);
  final Future<Box> _settingsBox = Hive.openBox(_settingsCache);

  @override
  Future<String?> getAccessToken() async {
    final box = await _authBox;
    return box.get(_accessTokenKey);
  }

  @override
  Future<void> saveAccessToken(String token) async {
    final box = await _authBox;
    await box.put(_accessTokenKey, token);
  }

  @override
  Future<int> getRefreshTokenTime() async {
    final box = await _authBox;
    return box.get(_refreshTokenTime, defaultValue: 0);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    final box = await _authBox;
    return box.put(_refreshTokenKey, token);
  }

  @override
  Future<String?> getRefreshToken() async {
    final box = await _authBox;
    return box.get(_refreshTokenKey);
  }

  @override
  Future<void> saveRefreshTokenTime(int expiresIn) async {
    final box = await _authBox;
    return box.put(
        _refreshTokenTime, DateTime.now().millisecondsSinceEpoch + expiresIn);
  }

  @override
  Future<void> clear() async {
    final box = await _authBox;
    await box.clear();
    final userBox = await _userBox;
    await userBox.clear();
  }

  @override
  Future<Locale> getCurrentLocale() async {
    final box = await _settingsBox;
    final languageCode = box.get(_localeKey, defaultValue: 'az');
    return Locale.fromSubtags(languageCode: languageCode);
  }

  @override
  Future<void> setCurrentLocale(Locale locale) async {
    final box = await _settingsBox;
    return box.put(_localeKey, locale.languageCode);
  }

  @override
  Stream<Locale> observeLocal() async* {
    final _box = await _settingsBox;
    final locale = await getCurrentLocale();
    yield  locale;
    yield* _box
        .watch(key: _localeKey)
        .transform(StreamTransformer<BoxEvent, Locale>.fromHandlers(
            handleData: _transformLocale))
        .asBroadcastStream();
  }

  void _transformLocale(BoxEvent data, EventSink<Locale> sink) {
    try {
      sink.add(Locale.fromSubtags(languageCode: data.value ?? 'az'));
    } catch (e) {
      print(e);
    }
  }
}
