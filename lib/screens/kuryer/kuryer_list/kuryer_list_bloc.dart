import 'package:kango/domain/entities/order_list.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/order_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';
import 'package:kango/presentation/bloc/paginable_bloc.dart';

class KuryerListBloc extends PaginableBloc<OrderList> {
  final OrderRepository _orderRepository = sl.get<OrderRepository>();

  @override
  Future<Pagination<OrderList>> provideSource(int page) {
    return _orderRepository.getOrderList(page);
  }
}
