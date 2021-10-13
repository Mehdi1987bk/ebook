import 'package:dio/dio.dart' hide Headers;
import 'package:kango/data/network/request/get_payment_link_request.dart';
import 'package:kango/data/network/response/payment_link_response.dart';

import 'package:retrofit/retrofit.dart';

import '../../../main.dart';

part 'payment_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PaymentApi {
  factory PaymentApi(Dio dio, {String? baseUrl}) = _PaymentApi;

  @POST('api/v1.0/mobile/profile/balance-tl/increase')
  Future<PaymentLinkResponse> getPaymentLink(
      @Header('Authorization') String token,
      @Body() GetPaymentLinkRequest request);
}
