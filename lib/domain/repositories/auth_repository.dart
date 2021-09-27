import 'package:kango/data/network/request/kuryer_request.dart';
import 'package:kango/data/network/request/login_request.dart';
import 'package:kango/data/network/request/registration_reguest.dart';


abstract class AuthRepository {
  Future<void> login(LoginRequest request);
  Future<void> logout();
  Future<void> registe(RegistrationRequest request);
  Future<bool> isLogged();
  Future<String> getToken();
}