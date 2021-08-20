import 'package:dio/dio.dart' hide Headers;
import 'package:kango/data/network/response/declaration_order_response.dart';

import 'package:retrofit/retrofit.dart';

import '../../../main.dart';

part 'order_api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class OrderApi {
  factory OrderApi(Dio dio, {String? baseUrl}) = _OrderApi;

  @GET('/api/v1.0/mobile/profile/declarations')
  Future<GetSubscribedListResponse> getDeclarations(
      @Header('Authorization') String token, @Query('page') int page);
}
