import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kango/call_interceptor.dart';
import 'package:kango/data/cache/cache_manager.dart';
import 'package:kango/data/network/api/book_api.dart';
import 'package:kango/data/network/api/user_api.dart';
import 'package:kango/data/repositories/data_auth_repository.dart';
import 'package:kango/data/repositories/data_payment_repository.dart';
import 'package:kango/domain/bd/book_dao.dart';
import 'package:kango/domain/bd/database.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/payment_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/kango_app.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'data/cache/data_cache_manager.dart';
import 'data/network/api/auth_api.dart';
import 'data/repositories/data_book_repository.dart';
import 'data/repositories/data_user_details.dart';
import 'domain/entities/gender.dart';
import 'domain/repositories/book_repository.dart';

final GetIt sl = GetIt.instance;
final logger = Logger(printer: SimplePrinter());
const baseUrl = 'https://bookleaks.org/';
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  final dir = await getApplicationDocumentsDirectory();
  
  final database = await $FloorFlutterDatabase
      .databaseBuilder('book_database.db')
      .build();
  final dao = database.bookDao;
  
  Hive
    ..init(dir.path)
    ..registerAdapter(GenderAdapter());
  _registerDependency(dao);
  runApp(App());
}

void _registerDependency(BookDao bookDao) {
  final dio =  _initDio();

  sl.registerLazySingleton<BookDao>(() => bookDao);

  sl.registerLazySingleton<AuthApi>(() => AuthApi(dio));
  sl.registerLazySingleton<UserApi>(() => UserApi(dio));
  sl.registerLazySingleton<BookApi>(() => BookApi(dio));
  sl.registerLazySingleton<AuthRepository>(() => DataAuthRepository());
  sl.registerLazySingleton<CacheManager>(() => DataCacheManager());
  sl.registerLazySingleton<UserRepository>(() => DataUserRepository());
  sl.registerLazySingleton<BookRepository>(() => DataBookRepository());
  sl.registerLazySingleton<PaymentRepository>(() => DataPaymentRepository());
}

Dio _initDio() {
  final dio = Dio();

  // dio.options.headers["content-type"] = "application/json";
  dio.options.headers["Accept"] = "*/*";
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;
  dio.options.sendTimeout = 30000;
  dio.interceptors.add(CallInterceptor());
  dio.interceptors.add(LogInterceptor(
      requestBody: true, responseBody: true, logPrint: logger.d));
  // dio.interceptors
  //     .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  // dio.interceptors.add(InterceptorsWrapper(
  //     onError: (DioError dioError) => _errorInterceptor(dioError)));
  sl.registerLazySingleton<Dio>(() => dio);

  return dio;
}


