import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';
import 'base_screen.dart';
import 'error_handler.dart';

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
      if ( error is DioError && error.response?.statusCode == 404) {
        // showSnackbar(
        //   AppLocalizations
        //       .of(context)
        //       .thisContentIsNotAvailable,
        // );
        Future<void>.delayed(const Duration(seconds: 1))
            .then((onValue) => Navigator.pop(context));
      } else
        showSnackbar(parseError(error, context));
    });
  }

  @override
  void dispose() {
    errorSubscription?.cancel();
    super.dispose();
  }
}
