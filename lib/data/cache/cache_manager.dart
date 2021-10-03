import 'package:kango/domain/entities/user_details.dart';

abstract class CacheManager {

  Future<void> saveAccessToken(String token);

  Future<String?> getAccessToken();

  Future<void> saveRefreshToken(String token);

  Future<String?> getRefreshToken();

  Future<void> saveRefreshTokenTime(int expiresIn);
  Future<void> clear();

  Future<int> getRefreshTokenTime();

  Stream<User> getUser();

  Future<void> updateLocalUser(User user);
}
