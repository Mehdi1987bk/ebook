

import 'package:kango/domain/entities/user_details.dart';

abstract class PaymentRepository {
  Future<String> getPaymentLink(int amount);

}