import 'package:kango/domain/entities/message.dart';
import 'package:kango/domain/entities/pagination.dart';
import 'package:kango/domain/repositories/order_repository.dart';
import 'package:kango/main.dart';
import 'package:kango/presentation/bloc/paginable_bloc.dart';

class MessagesBloc extends PaginableBloc<Message>{
  final OrderRepository _orderRepository = sl.get<OrderRepository>();
  @override
  Future<Pagination<Message>> provideSource(int page) async {
    return _orderRepository.getMessages(page);

  }

}