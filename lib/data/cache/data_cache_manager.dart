import 'package:hive_flutter/adapters.dart';
import 'package:kango/data/cache/cache_manager.dart';
import 'package:kango/domain/entities/user_details.dart';

const _authCache = 'AuthCache';
const _userCache = 'UserCache';

const _refreshTokenKey = 'RefreshTokenKey';
const _accessTokenKey = 'AccessTokenKey';
const _refreshTokenTime = 'RefreshTokenTime';

const _userKey = 'UserKey';

class DataCacheManager implements CacheManager {
  final Future<Box> _authBox = Hive.openBox(_authCache);
  final Future<Box> _userBox = Hive.openBox(_userCache);

  @override
  Future<String?> getAccessToken() async {
    final box = await _authBox;
    return box.get(_accessTokenKey);
  }

  @override
  Future<void> saveAccessToken(String token) async {
    final box = await _authBox;
    return box.put(_accessTokenKey, token);
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
  Stream<User> getUser() async* {
    final box = await _userBox;
    final User? user = box.get(_userKey);
    if(user != null){
      yield user;
    }
    yield* box.watch(key: _userKey).map((event) => event.value);
  }

  @override
  Future<void> updateLocalUser(User user) async{
    final box = await _userBox;
    await box.put(_userKey, user);
  }
}
