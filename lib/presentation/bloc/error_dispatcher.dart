import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';
import 'base_screen.dart';
import 'error_handler.dart';

typedef bool ErrorHandler(Object error);


mixin ErrorDispatcher<Page extends BaseScreen, Bloc extends BaseBloc>
    on BaseState<Page, Bloc> {
  StreamSubscription? errorSubscription;

  @override
  void initState() {
    super.initState();
    errorSubscription = bloc.errorStream
    // this will prevent multiple messages from showing up in a short interval of time
        .transform(ThrottleStreamTransformer<Object>(
            (_) => TimerStream<Object>(true, const Duration(seconds: 2))))
        .listen((error) {
      if (error.runtimeType == DioError &&
          (error as DioError).response?.statusCode == 404) {
        final responseBody = error.response?.data;
        if (responseBody is Map) {
          if (responseBody['error'] != null ) {
            showSnackbar(responseBody['error']);
            return ;
          } else if (responseBody['errors'] != null) {
            if ((responseBody['errors'] as Map).values.first is
            List) {
              showSnackbar(
                  (responseBody['errors'] as Map).values.first.first);
              return ;
            }
          }
        }
        return;
      }
      if(errorHandler == null){
        showSnackbar(parseError(error, context));
      }else{
        if(errorHandler!.call(error)){
          showSnackbar(parseError(error, context));
        }
      }
    });
  }

  @override
  void dispose() {
    errorSubscription?.cancel();
    super.dispose();
  }

  ErrorHandler? get errorHandler => null;


}
