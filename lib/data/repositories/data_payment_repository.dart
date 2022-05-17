
import 'package:kango/domain/entities/pagination.dart';

import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/payment_repository.dart';
import 'package:kango/main.dart';

class DataPaymentRepository implements PaymentRepository {
  final _authRepository = sl.get<AuthRepository>();

}
