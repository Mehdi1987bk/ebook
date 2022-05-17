import 'package:kango/data/network/request/forgot_password_request.dart';
import 'package:kango/data/network/request/login_request.dart';
import 'package:kango/data/network/request/registration_reguest.dart';
import 'package:kango/data/network/request/update_password_request.dart';

import '../../data/network/response/get_author_books_response.dart';
import '../entities/book.dart';
import '../entities/pagination.dart';


abstract class AuthRepository {
  Future<void> login(LoginRequest request);
  Future<void> logout();
  Future<void> forgotPassword(ForgotPasswordRequest request);
  Future<void> register(RegistrationRequest request);
  Future<bool> isLogged();
  Future<void> editPassword(UpdatePasswordRequest request);
  Future<List<Book>?> getAuthorBooks({int page = 1});

}