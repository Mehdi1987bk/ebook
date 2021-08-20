import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kango/generated/l10n.dart';

import '../../main.dart';

String parseError(dynamic error, BuildContext context) {
  logger.e(error);
  String message;
  switch (error.runtimeType) {
    case DioError:
      message = _parseDioError(error as DioError, context);
      break;
    default:
      message = error.toString();
  }
  return message;
}

String _parseDioError(
  DioError error,
  BuildContext context,
) {
  String message;
  switch (error.type) {
    case DioErrorType.other:
      if (error.error is SocketException) {
        message = S.of(context).noInternetConnection;
      } else {
        final dioError = error.error?.body.toString();
        message = dioError ?? S.of(context).somethingWentWrong;
      }
      break;
    case DioErrorType.response:
      try {
        message = error.message;
      } catch (e) {
        logger.e(e);
        message = error.message;
      }

      break;
    default:
      message = S.of(context).somethingWentWrong;
  }
  return message;
}
