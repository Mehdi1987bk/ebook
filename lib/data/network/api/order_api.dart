import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:kango/data/network/request/send_declarations.dart';
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

  @PUT('api/v1.0/mobile/profile/declarations/short-declarations/update')
  @Headers(<String, String>{"content-type": "multipart/form-data"})
  Future<void> sendDeclarations(
      @Header('Authorization') String token,
      {@Part(name: "tracking_no") required String trackingNo,
      @Part() required String price,
      @Part(name: 'document[]') required File file});
}
