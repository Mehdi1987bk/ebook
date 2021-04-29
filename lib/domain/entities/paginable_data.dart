

import 'package:kango/domain/entities/pagination.dart';

class PaginableData<T>{
 final List<T> data;
 final Pagination pagination;

  PaginableData({this.data, this.pagination});

}