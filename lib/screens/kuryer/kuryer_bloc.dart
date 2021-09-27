import 'package:kango/data/network/request/kuryer_request.dart';
import 'package:kango/domain/repositories/order_repository.dart';
import 'package:kango/presentation/bloc/base_bloc.dart';

import '../../main.dart';

class KuryerBloc extends BaseBloc{
  final OrderRepository _orderRepository = sl.get<OrderRepository>();
  Future<void> kuryer(String address) {
    return  run(_orderRepository.kuryer(KuryerRequest(address: address)));

  }
}