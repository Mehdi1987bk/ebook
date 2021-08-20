import 'package:kango/domain/entities/declaration.dart';
import 'package:kango/domain/entities/pagination.dart';

abstract class OrderRepository{
  Future<Pagination<Declaration>> getDeclarations(int page);
}