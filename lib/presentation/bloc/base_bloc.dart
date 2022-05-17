import 'dart:async';
import 'dart:ui';

import 'package:kango/data/cache/cache_manager.dart';
import 'package:rxdart/rxdart.dart';

import '../../main.dart';

typedef AsyncBloc<T> = Future<T> Function();

abstract class BaseBloc {
  final cacheManager = sl.get<CacheManager>();

  final _errorSubject = PublishSubject<Object>();

  final _loadingIndicator = BehaviorSubject<bool>();

  Sink<dynamic> get errorSink => _errorSubject.sink;

  Stream<dynamic> get errorStream => _errorSubject.stream;

  Sink<bool> get loadingSink => _loadingIndicator.sink;

  Stream<bool> get loadingStream => _loadingIndicator.stream;

  int _taskCounter = 0;

  void dispatchError(Object error) {
    if (!_errorSubject.isClosed) {
      errorSink.add(error);
    }
  }

  void init() {
    cacheManager.observeLocal().listen(onLocaleChanged);
  }

  void onLocaleChanged(Locale locale) {}

  void dispose() {
    _errorSubject.close();
    _loadingIndicator.close();
  }

  Future<T> run<T>(Future<T> future) async {
    loadingSink.add(++_taskCounter > 0);
    try {
      var result = await future;
      return Future.value(result);
    } catch (e) {
      print(e);
      dispatchError(e);
      return Future.error(e);
    } finally {
      if (!_loadingIndicator.isClosed) {
        _loadingIndicator.add(--_taskCounter > 0);
      }
    }
  }

  Stream<T> runStream<T>(AsyncBloc<T> bloc) async* {
    loadingSink.add(++_taskCounter > 0);
    try {
      var result = await bloc();
      yield result;
    } catch (e) {
      print(e);
      dispatchError(e);
    } finally {
      if (!_loadingIndicator.isClosed) {
        _loadingIndicator.add(--_taskCounter > 0);
      }
    }
    yield* cacheManager.observeLocal().transform(
        StreamTransformer<Locale, T>.fromHandlers(
            handleData: (locale, sink) =>
                _localeHandler<T>(locale, sink, bloc)));
  }

  void _localeHandler<T>(
      Locale locale, EventSink<T> sink, AsyncBloc<T> bloc) async {
    loadingSink.add(++_taskCounter > 0);
    try {
      final value = await bloc();
      sink.add(value);
    } catch (e) {
      dispatchError(e);
      print(e);
    } finally {
      if (!_loadingIndicator.isClosed) {
        _loadingIndicator.add(--_taskCounter > 0);
      }
    }
  }
}
