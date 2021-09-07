import 'dart:io';

import 'package:kango/data/network/api/order_api.dart';
import 'package:kango/data/network/request/send_declarations.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/order_repository.dart';

import '../../main.dart';

class DataOrderRepository implements OrderRepository {
  final _authRepository = sl.get<AuthRepository>();
  final _orderApi = sl.get<OrderApi>();

  @override
  Future<Pagination<Declaration>> getDeclarations(int page) async {
    final token = await _authRepository.getToken();
    final response = await _orderApi.getDeclarations('Bearer $token', page);
    return response.packages;
  }

  @override
  Future<void> sendDeclarations(SendDeclarationRequest request, File file) async {
    final token = await _authRepository.getToken();
    return _orderApi.sendDeclarations('Bearer $token',
        trackingNo: request.trackingNo, price: request.price, file: file);
  }
}
