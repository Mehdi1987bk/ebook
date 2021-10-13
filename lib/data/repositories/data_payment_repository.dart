import 'package:kango/data/network/api/payment_api.dart';
import 'package:kango/data/network/request/get_payment_link_request.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/payment_repository.dart';
import 'package:kango/main.dart';

class DataPaymentRepository implements PaymentRepository {
  final _authRepository = sl.get<AuthRepository>();
  final _paymentApi = sl.get<PaymentApi>();

  @override
  Future<String> getPaymentLink(int amount) async {
    final token = await _authRepository.getToken();
    final response = await _paymentApi.getPaymentLink(
        'Bearer $token' , GetPaymentLinkRequest(amount: amount));
    return response.url;
  }
}
