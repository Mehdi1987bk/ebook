import 'dart:async';

import 'package:async/async.dart';
import 'package:kango/domain/entities/paginable_data.dart';
import 'package:rxdart/rxdart.dart';
import '';
import 'base_bloc.dart';

const initialPaginationPage = 1;

abstract class PaginableBloc<T> extends BaseBloc {
  List<T> data = List<T>();
  bool loaderVisibility = true;
  Future<PaginableData<T>> source;
  BehaviorSubject<List<T>> paginableList = BehaviorSubject<List<T>>();

  CancelableOperation<PaginableData<T>> _cancellableOperation;
  int _page = initialPaginationPage;
  bool _isRunning = false;
  bool _hasNextPage = true;
  Completer<void> _refreshCompleter = Completer<void>();

  Future<PaginableData<T>> provideSource(int page);

  @override
  dispose() {
    paginableList.close();
    _cancellableOperation?.cancel();
    super.dispose();
  }

  Future load({bool refresh = false, bool cancelable = false}) async {
    if (cancelable) {
      _isRunning = false;
    }
    if (_isRunning) {
      return;
    }
    if (refresh) {
      _page = initialPaginationPage;
      _hasNextPage = true;
    }
    if (_hasNextPage) {
      _loadData(refresh: refresh, cancelable: cancelable);
      return _refreshCompleter.future;
    }
    return;
  }

  void _loadData({bool refresh = false, bool cancelable}) {
    _isRunning = true;
    loadingSink.add(true && loaderVisibility);
    if (cancelable) {
      if (!_cancellableOperation.isCanceled) {
        _cancellableOperation?.cancel();
      }
    }
    _cancellableOperation =
    CancelableOperation<PaginableData<T>>.fromFuture(provideSource(_page));
    _cancellableOperation.value.then((pagination) {
      if (pagination != null) {
        if (refresh) {
          data.clear();
        }
        data.addAll(pagination.data);
        _page++;
        _hasNextPage = pagination.pagination.hasNextPage;
        paginableList.add(data);
      }
    }).catchError((error) {
      dispatchError(error);
    }).whenComplete(() {
      _isRunning = false;
      loaderVisibility = false;
      loadingSink.add(false);
      _refreshCompleter?.complete();
      _refreshCompleter = Completer<void>();
    });
  }

  void deletedItem(T item) {
    bool isDeleted = data.remove(item);
    if (isDeleted) paginableList.add(data);
  }

  void updateItem(T item, int index) {
    data[index] = item;
    paginableList.add(data);
  }
}
