import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kango/data/cache/cache_manager.dart';
import 'package:kango/screens/splesh/splesh_screen.dart';

import 'app_theme.dart';
import 'generated/l10n.dart';
import 'main.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final locale = sl.get<CacheManager>().observeLocal();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
        stream: locale,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              locale: snapshot.requireData,
              navigatorObservers: [routeObserver],
              theme: appTheme,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: SpleshScreen(),
            );
          }
          return const SizedBox();
        });
  }
}
