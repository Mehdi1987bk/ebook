import 'package:kango/presentation/bloc/base_bloc.dart';

import '../../../../../data/network/response/get_user_cart_info.dart';
import '../../../../../data/network/response/user_details_response.dart';
import '../../../../../domain/repositories/user_repository.dart';
import '../../../../../main.dart';

class CartInfoBlo extends BaseBloc{
  Future<GetUserCartInfo> userCart =
  sl.get<UserRepository>().getUserCartInfo();
}