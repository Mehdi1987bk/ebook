import 'package:kango/data/network/request/login_request.dart';


abstract class AuthRepository {
  Future<void> login(LoginRequest request);
  Future<bool> isLogged();
  Future<String> getToken();
}