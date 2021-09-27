import 'dart:io';

import 'package:kango/data/network/request/kuryer_request.dart';
import 'package:kango/data/network/request/send_declarations.dart';
import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/order_list.dart';
import 'package:kango/domain/entities/pagination.dart';

abstract class OrderRepository {
  Future<Pagination<Declaration>> getDeclarations(int page);

  Future<void> sendDeclarations(SendDeclarationRequest request, File file);

  Future<void> kuryer(KuryerRequest request);

  Future<Pagination<OrderList>> getOrderList(int page);
}
