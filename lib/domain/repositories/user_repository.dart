

import 'package:kango/domain/entities/user_details.dart';

abstract class UserRepository {
 Future<User> getUserDetails();
}