import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kango/app_theme.dart';
import 'package:kango/data/cache/cache_manager.dart';
import 'package:kango/data/network/api/order_api.dart';
import 'package:kango/data/network/api/user_api.dart';
import 'package:kango/data/repositories/data_auth_repository.dart';
import 'package:kango/domain/repositories/auth_repository.dart';
import 'package:kango/domain/repositories/user_repository.dart';
import 'package:kango/screens/splesh/splesh_screen.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'data/cache/data_cache_manager.dart';
import 'data/network/api/auth_api.dart';
import 'data/repositories/data_order_repository.dart';
import 'data/repositories/data_user_details.dart';
import 'domain/entities/gender.dart';
import 'domain/entities/user_details.dart';
import 'domain/repositories/order_repository.dart';
import 'generated/l10n.dart';

final GetIt sl = GetIt.instance;
final logger = Logger(printer: SimplePrinter());
const baseUrl = 'https://kango.az/';
const clientId = 4;
const clientSecret = 'C8ghwl5ubVjVbyxLf7vlpEGVC7IGh9dkz8Efy5Az';
const granyType = 'password';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  final dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(GenderAdapter());
  _registerDependency();
  runApp(MyApp());
}

void _registerDependency() {
  final dio = _initDio();

  sl.registerLazySingleton<AuthApi>(() => AuthApi(dio));
  sl.registerLazySingleton<UserApi>(() => UserApi(dio));
  sl.registerLazySingleton<OrderApi>(() => OrderApi(dio));
  sl.registerLazySingleton<AuthRepository>(() => DataAuthRepository());
  sl.registerLazySingleton<CacheManager>(() => DataCacheManager());
  sl.registerLazySingleton<UserRepository>(() => DataUserRepository());
  sl.registerLazySingleton<OrderRepository>(() => DataOrderRepository());
}

Dio _initDio() {
  final dio = Dio();
  dio.options.headers["content-type"] = "application/json";
  dio.options.headers["accept"] = "application/json";
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;
  dio.options.sendTimeout = 30000;
  dio.interceptors.add(LogInterceptor(
      requestBody: true, responseBody: true, logPrint: logger.d));
  // dio.interceptors
  //     .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
  // dio.interceptors.add(InterceptorsWrapper(
  //     onError: (DioError dioError) => _errorInterceptor(dioError)));
  sl.registerLazySingleton<Dio>(() => dio);

  return dio;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: SpleshScreen(),
    );
  }
}
